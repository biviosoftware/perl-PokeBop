# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Util::TestUser;
use strict;
use Bivio::Base 'ShellUtil';


sub init {
    my($self) = @_;
    my(@res) = shift->SUPER::init(@_);
    foreach my $x (1..5)  {
	$self->create("player$x");
    }
    return @res;
}

1;
