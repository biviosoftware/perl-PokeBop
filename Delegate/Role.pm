# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Delegate::Role;
use strict;
use Bivio::Base 'Delegate';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub get_delegate_info {
    my($proto) = @_;
    return [
        @{$proto->SUPER::get_delegate_info},
        CARD_GAME_WINNER => 21,
    ];
}

1;
