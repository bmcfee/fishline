#!/usr/bin/env fish
# -*-  mode:fish; tab-width:4  -*-

# Powerline Glyphs →  ⇡       ⚡ ± ✘ ⚙ ➦
set FLSYM_CLOSE				""
set FLSYM_SEPARATOR			"  "
set FLSYM_WRITE_LOCK		"  "
set FLSYM_GIT_BRANCH		"  "
set FLSYM_GIT_UNTRACKED		"× "
set FLSYM_GIT_AHEAD			"⇡ "
set FLSYM_GIT_BEHIND		"⇡ "
set FLSYM_ARROW				" → "

source $FLINE_PATH/themes/default.fish
set FLINE_PROMPT VFISH STATUS PWD GIT WRITE N ARROW

for seg in (find $FLINE_PATH/segments -name '*.fish')
    source $seg
end

function FLINT_CLOSE

	if set -q __bcolor
		set_color -b $argv[1]
		set_color $FLINT_BCOLOR
		echo -n "$FLSYM_CLOSE"
	set_color normal
	end
	set -g FLINT_BCOLOR $argv[1]
	set_color -b $argv[1] $argv[2]
 
end

function fishline

	set -g FLINT_STATUS $argv[1]
	if not set -q FLINT_STATUS[1]
		echo "Warning: last status not passed as first argument to fishline,"
		set FLINT_STATUS 0
	end

	set -e FLINT_BCOLOR
	for seg in $FLINE_PROMPT
		eval FLSEG_$seg
	end
	FLINT_CLOSE normal normal
	set -e FLINT_BCOLOR

end