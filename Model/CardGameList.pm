# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Model::CardGameList;
use strict;
use Bivio::Base 'Biz.ListModel';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub internal_initialize {
    my($self) = @_;
    return $self->merge_initialize_info($self->SUPER::internal_initialize, {
        version => 1,
        primary_key => [
	    [qw(CardGame.card_game_id RealmUser.realm_id RealmOwner.realm_id)],
	],
	auth_id => 'CardGame.owner_realm_id',
	order_by => [
	    'RealmOwner.creation_date_time',
	    'winner.RealmOwner.display_name',
	],
	other => [
	    [qw(CardGame.card_game_id HandCard.card_game_id)],
	    [qw(HandCard.user_id RealmUser.user_id winner.RealmOwner.realm_id)],
	    ['RealmUser.role', [b_use('Auth.Role')->CARD_GAME_WINNER]],
	    'HandCard.suit_rank',
	],
    });
}

1;
