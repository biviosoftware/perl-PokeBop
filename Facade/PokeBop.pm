# Copyright (c) 2010 bivio Software, Inc.  All rights reserved.
# $Id$
package PokeBop::Facade::PokeBop;
use strict;
use Bivio::Base 'Bivio::UI::FacadeBase';


my($_SELF) = __PACKAGE__->new({
    uri => 'pokebop',
    http_host => 'www.pokebop.com',
    mail_host => 'pokebop.com',
    Constant => [
	[ThreePartPage_want_ForumDropDown => 1],
	[ThreePartPage_want_dock_left_standard => 1],
    ],
    Task => [
	[SOURCE => 'src/*'],
	[CARD_GAME_CREATE => '?/play-game'],
	[CARD_GAME_LIST => '?/games'],
	[CARD_GAME_NO_PLAYERS => undef],
    ],
    Text => [
	[site_name => q{bivio Software, Inc.}],
	[site_copyright => q{bivio Software, Inc.}],
	[home_page_uri => '/bp'],
	[title => [
	    SOURCE => '',
	    CARD_GAME_CREATE => 'Play Poker',
	    CARD_GAME_LIST => 'Poker Games',
	]],
	[acknowledgement => [
	    CARD_GAME_CREATE => 'Thank you for playing.',
	    CARD_GAME_NO_PLAYERS => 'You must have some players to play!',
	]],
	[CardGameList => [
	    'winner.RealmOwner.display_name' => 'Winner',
	    'HandCard.suit_rank' => 'Highest Card',
	    'RealmOwner.creation_date_time' => 'When Played',
	]],
    ],
});

1;
