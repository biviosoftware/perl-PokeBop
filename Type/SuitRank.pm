# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Type::SuitRank;
use strict;
use Bivio::Base 'Type.Enum';

__PACKAGE__->compile_with_numbers([
    map({
	my($rank) = $_;
	map("$_$rank", qw(CLUB DIAMOND HEART SPADE));
    } 2..13, 1),
]);

1;
