# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::Util::SQL;
use strict;
use Bivio::Base 'ShellUtil';

# export BCONF=~/bconf/pb.bconf
# cd files/ddl
# perl -w ../../Util/pb-sql init_dbms
# perl -w ../../Util/pb-sql create_test_db

my($_RT) = b_use('Auth.RealmType');

sub ddl_files {
    return shift->SUPER::ddl_files(['bOP', 'pb']);
}

sub initialize_db {
    my($self) = shift;
    my(@res) = $self->SUPER::initialize_db(@_);
    _init_realm_card_game($self);
    $self->new_other('SiteForum')->init;
    return @res;
}

sub initialize_test_data {
    my($self) = @_;
    my(@res) = shift->SUPER::initialize_test_data(@_);
    $self->new_other('TestUser')->init;
    return @res;
}

sub _init_realm_card_game {
    my($self) = @_;
    $self->init_realm_role_with_config($self->realm_role_config);
    return;
}

1;

__DATA__
b-realm-role -realm CARD_GAME -user user edit ANONYMOUS - \
    +ANYBODY
b-realm-role -realm CARD_GAME -user user edit USER - \
    +ANONYMOUS \
    +ANY_USER
b-realm-role -realm CARD_GAME -user user edit WITHDRAWN - \
    +USER
b-realm-role -realm CARD_GAME -user user edit GUEST - \
    +USER
b-realm-role -realm CARD_GAME -user user edit MEMBER - \
    +GUEST \
    +DATA_READ \
    +DATA_WRITE
b-realm-role -realm CARD_GAME -user user edit ACCOUNTANT - \
    +MEMBER
b-realm-role -realm CARD_GAME -user user edit ADMINISTRATOR - \
    +ACCOUNTANT
b-realm-role -realm CARD_GAME -user user edit UNAPPROVED_APPLICANT - \
    +USER
b-realm-role -realm CARD_GAME -user user edit MAIL_RECIPIENT -
b-realm-role -realm CARD_GAME -user user edit FILE_WRITER -
