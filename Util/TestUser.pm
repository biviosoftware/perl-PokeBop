# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Util::TestUser;
use strict;
use Bivio::Base 'ShellUtil';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub init {
    my($self) = @_;
    my(@res) = shift->SUPER::init(@_);
    foreach my $x (1..5)  {
	$self->create("player$x");
    }
    return @res;
}

1;
