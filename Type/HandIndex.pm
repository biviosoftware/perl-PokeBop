# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Type::HandIndex;
use strict;
use Bivio::Base 'Type.Integer';


sub get_max {
    return 5;
}

sub get_min {
    return 1;
}

1;
