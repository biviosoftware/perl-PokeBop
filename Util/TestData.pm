# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Util::TestData;
use strict;
use Bivio::Base 'Bivio.ShellUtil';


sub reset_card_games {
    my($self) = @_;
    $self->initialize_fully;
    $self->model('CardGame')->do_iterate(
	sub {
	    my($it) = @_;
	    $it->cascade_delete;
	    return 1;
	},
	'unauth_iterate_start',
	'card_game_id',
    );
    return;
}

1;
