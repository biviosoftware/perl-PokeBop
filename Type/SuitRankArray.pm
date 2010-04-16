# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Type::SuitRankArray;
use strict;
use Bivio::Base 'Type.ArrayBase';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);
my($_SR) = b_use('Type.SuitRank');
my($_R) = b_use('Biz.Random');

sub UNDERLYING_TYPE {
    return $_SR;
}

sub new_card_deck {
    my($proto) = @_;
    my($cards) = [$proto->UNDERLYING_TYPE->get_list];
    return $proto->new([
	map(
	    splice(@$cards, $_R->integer(scalar(@$cards)), 1),
	    1 .. 52,
	),
     ]);
}

1;
