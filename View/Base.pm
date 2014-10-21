# Copyright (c) 2010 bivio Software, Inc.  All rights reserved.
# $Id$
package PokeBop::View::Base;
use strict;
use Bivio::Base 'View.ThreePartPage';
use Bivio::UI::ViewLanguageAUTOLOAD;


sub VIEW_SHORTCUTS {
    return 'PokeBop::ViewShortcuts';
}

sub internal_xhtml_adorned {
    my($self) = shift;
    my(@res) = $self->SUPER::internal_xhtml_adorned(@_);
    view_unsafe_put(
	xhtml_footer_left => Join([
	    XLink('back_to_top'),
	    DIV_pet_task_info(TaskInfo({})),
	]),
    );
    return @res;
}

1;
