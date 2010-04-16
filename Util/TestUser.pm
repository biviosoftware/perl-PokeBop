# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Util::TestUser;
use strict;
use Bivio::Base 'ShellUtil';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub init {
    my($self) = shift;
    return $self->call_super_before(\@_, sub {
	foreach my $x (1..5)  {
	    $self->create("player$x");
	}
        return;
    });
}

1;
