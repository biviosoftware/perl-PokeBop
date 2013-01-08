# Copyright (c) 2010-2013 bivio Software, Inc.  All rights reserved.
# $Id$
package PokeBop::BConf;
use strict;
use base 'Bivio::BConf';

our($VERSION) = sprintf('%d.%02d', q$Revision$ =~ /\d+/g);

sub merge_overrides {
    my($proto, $host) = @_;
    return Bivio::IO::Config->merge_list({
	$proto->merge_class_loader({
	    delegates => {
		'Bivio::Agent::HTTP::Cookie' => 'Bivio::Delegate::Cookie',
		'Bivio::Agent::TaskId' => 'PokeBop::Delegate::TaskId',
		'Bivio::Auth::Support' => 'Bivio::Delegate::SimpleAuthSupport',
		'Bivio::Auth::RealmType' => 'PokeBop::Delegate::RealmType',
		'Bivio::Auth::Role' => 'PokeBop::Delegate::Role',
		'Bivio::TypeError' => 'PokeBop::Delegate::TypeError',
	    },
	    maps => {
		Action => ['PokeBop::Action'],
		Delegate => ['PokeBop::Delegate'],
		Facade => ['PokeBop::Facade'],
		Model => ['PokeBop::Model'],
		ShellUtil => ['PokeBop::Util'],
		TestLanguage => ['PokeBop::Test'],
		Type => ['PokeBop::Type'],
		View => ['PokeBop::View'],
		XHTMLWidget => ['PokeBop::XHTMLWidget'],
	    },
	}),
	'Bivio::UI::Facade' => {
	    default => 'PokeBop',
	    http_host => 'www.pokebop.com',
	    mail_host => 'pokebop.com',
	},
	$proto->merge_http_log({
	    ignore_list => [
	    ],
	    error_list => [
	    ],
	    critical_list => [
	    ],
	}),
    },
    $proto->default_merge_overrides({
	version => 10,
	root => 'PokeBop',
	prefix => 'pb',
	owner => 'bivio Software, Inc.',
    }));
}

1;
