# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Model::CardGame;
use strict;
use Bivio::Base 'Model.RealmOwnerBase';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);
my($_SRA) = b_use('Type.SuitRankArray');
my($_R) = b_use('Auth.Role');
my($_RS) = b_use('Auth.RoleSet');
my($_ADMINS) = ${$_RS->from_array($_R->get_category_role_group('all_admins'))};
my($_EMPTY) = $_RS->get_min;
my($_MAX_PLAYERS) = 9;

sub USER_ID_FIELD {
    return 'user_id';
}

sub create_realm {
    my($self) = @_;
    $self->create({
	owner_realm_id => $self->req('auth_id'),
    });
    return $self->call_super_before([{}], sub {
	_play($self, _players($self));
	return;
    });
}

sub internal_initialize {
    my($self) = @_;
    return $self->merge_initialize_info($self->SUPER::internal_initialize, {
        version => 1,
        table_name => 'card_game_t',
	columns => {
	    card_game_id => ['PrimaryId', 'PRIMARY_KEY'],
	    owner_realm_id => ['RealmOwner.realm_id', 'NOT_NULL'],
	},
    });
}

sub _is_admin {
    my($roles) = @_;
    return b_debug(grep($_->eq_administrator, @$roles)) ? 1 : 0;
    return 0;
    return !$_RS->is_equal(
	${$_RS->from_array($roles)} & $_ADMINS,
	$_EMPTY,
    );
}


sub _players {
    my($self) = @_;
    my($res) = [];
    $self->new_other('GroupUserList')->do_iterate(
	sub {
	    my($it) = @_;
	    return 1
		if _is_admin($it->get('roles'));
	    my($uid) = $it->get('RealmUser.user_id');
#NOTE: RealmUserAddForm was too complex (not_mail_recipient, ...)
	    _realm_user($self, $uid, 'MEMBER');
	    push(@$res, $uid);
	    return @$res >= $_MAX_PLAYERS ? 0 : 1;
	},
    );
    $self->throw_die('NO_RESOURCES')
	unless @$res;
    return $res;
}

sub _realm_user {
    my($self, $uid, $role) = @_;
    return $self->new_other('RealmUser')->create({
	realm_id => $self->get('card_game_id'),
	user_id => $uid,
	role => $_R->from_any($role),
    });
}

sub _play {
    my($self, $players) = @_;
    my($cards) = $_SRA->new_card_deck->as_array;
    my($max_card) = $_SRA->UNDERLYING_TYPE->get_min;
    my($max_uid);
    foreach my $uid (@$players) {
	$self->new_other('HandCard')->create({
	    card_game_id => $self->get('card_game_id'),
	    user_id => $uid,
	    suit_rank => my $card = shift(@$cards),
	    hand_index => 1,
	    is_turned_up => 0,
	});
#NOTE: style is to prefer not indenting.
	next
	    unless $max_card->is_less_than($card);
	$max_card = $card;
	$max_uid = $uid;
    }
#NOTE: If !$max_uid, dies.  Implicit fast fail
    _realm_user($self, $max_uid, 'CARD_GAME_WINNER');
    return;
}

1;
