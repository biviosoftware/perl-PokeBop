# Copyright (c) 2010 bivio Software, Inc.  All rights reserved.
# $Id$
package PokeBop::Delegate::TaskId;
use strict;
use Bivio::Base 'Delegate';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub get_delegate_info {
    my($proto) = @_;
    return $proto->merge_task_info(@{$proto->standard_components}, [
	[qw(
            SOURCE
            501
	    GENERAL
	    ANYBODY
	    View.Source->show_module
	)],
	[qw(
            CARD_GAME_HOME
            502
	    CARD_GAME
	    ANYBODY
	)],
	[qw(
	    CARD_GAME_CREATE
	    503
	    ANY_OWNER
	    ADMIN_READ&ADMIN_WRITE
	    Action.CardGame
	    Action.ClientRedirect->execute_next
	    next=CARD_GAME_LIST
	    NO_RESOURCES=CARD_GAME_NO_PLAYERS
	)],
	[qw(
	    CARD_GAME_LIST
	    504
	    ANY_OWNER
	    DATA_READ
	    Model.CardGameList->execute_load_page
	    View.CardGame->list
	)],
	[qw(
	    CARD_GAME_NO_PLAYERS
	    505
	    ANY_OWNER
	    ADMIN_READ&ADMIN_WRITE
	    Action.CardGame->execute_no_players
	    next=CARD_GAME_LIST
	)],
    ]);
}

1;
