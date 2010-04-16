# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Action::CardGame;
use strict;
use Bivio::Base 'Biz.Action';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);
my($_CG) = b_use('Model.CardGame');
my($_A) = b_use('Action.Acknowledgement');

sub execute {
    my($proto, $req) = @_;
    $_CG->new($req)->create_realm;
    $_A->save_label($req);
    return;
}

sub execute_no_players {
    my(undef, $req) = @_;
    $_A->save_label($req);
    return 'next';
}

1;
