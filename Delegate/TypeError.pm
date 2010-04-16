# Copyright (c) 2010 bivio Software, Inc.  All rights reserved.
# $Id$
package PokeBop::Delegate::TypeError;
use strict;
use Bivio::Base 'Bivio::Delegate::SimpleTypeError';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub get_delegate_info {
    return [
	@{shift->SUPER::get_delegate_info(@_)},
    ];
}

1;
