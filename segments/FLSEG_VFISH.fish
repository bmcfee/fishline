#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-

function FLSEG_VFISH

    if set -q VIRTUAL_ENV
        __FLINT_SEGMENT $FLCLR_VFISH_BG $FLCLR_VFISH_FG
        printf $FLSYM_VFISH" "(basename $VIRTUAL_ENV)
    end

end
