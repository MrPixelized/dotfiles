#! /bin/bash

# Make single frames in empty tags completely transparnt when
# focused
herbstclient --idle focus_changed | while read event; do
	herbstclient mktemp int OPACITY chain \
	: set_attr OPACITY 100 \
	: and . compare tags.focus.frame_count = 1 \
	. compare tags.focus.curframe_wcount = 0 \
	. set_attr OPACITY 0 \
	: substitute VAL OPACITY set frame_active_opacity VAL
done
