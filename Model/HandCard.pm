# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$

####### NOTE: PlayingCard was not clear what it was bound to
package PokeBop::Model::HandCard;
use strict;
use Bivio::Base 'Model.RealmBase';


sub REALM_ID_FIELD {
    return 'card_game_id';
}

sub create {
    my($self, $values) = @_;
    $values->{is_turned_up} = 0
	unless defined($values->{is_turned_up});
    return shift->SUPER::create(@_);    
}

sub internal_initialize {
    my($self) = @_;
    return $self->merge_initialize_info($self->SUPER::internal_initialize, {
        version => 1,
	table_name => 'hand_card_t',
        columns => {
	    $self->REALM_ID_FIELD => ['CardGame.card_game_id', 'PRIMARY_KEY'],
	    $self->USER_ID_FIELD => ['User.user_id', 'PRIMARY_KEY'],
#NOTE: Need order of cards in a hand or community
	    hand_index => ['HandIndex', 'PRIMARY_KEY'],
	    suit_rank => ['SuitRank', 'NOT_ZERO_ENUM'],
#NOTE: To save time, I added this
	    is_turned_up => ['Boolean', 'NOT_NULL'],
	},
    });
}

1;
