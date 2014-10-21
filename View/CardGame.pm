# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::View::CardGame;
use strict;
use Bivio::Base 'View.Base';
use Bivio::UI::ViewLanguageAUTOLOAD;


sub list {
    return shift->internal_put_base_attr(
	tools => TaskMenu([
	    'CARD_GAME_CREATE',
	]),
	body => vs_paged_list(CardGameList => [
	    'RealmOwner.creation_date_time',
	    'winner.RealmOwner.display_name',
	    ['HandCard.suit_rank', {
		column_widget => Image(
		    [sub {lc($_[1])}, ['HandCard.suit_rank', '->get_name']],
		),
	    }],
	]),
    );
}

1;
