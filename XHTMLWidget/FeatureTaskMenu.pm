# Copyright (c) 2010 bivio Software, Inc.  All Rights Reserved.
# $Id$
package PokeBop::XHTMLWidget::FeatureTaskMenu;
use strict;
use Bivio::Base 'XHTMLWidget';


sub internal_tasks {
    return [
	@{shift->SUPER::internal_tasks(@_)},
	'CARD_GAME_LIST',
    ];
}

1;
