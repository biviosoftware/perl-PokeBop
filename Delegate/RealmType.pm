# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Delegate::RealmType;
use strict;
use Bivio::Base 'Delegate';


sub get_delegate_info {
    my($proto) = @_;
    return [
        @{$proto->SUPER::get_delegate_info},
        CARD_GAME => 21,
    ];
}

1;
