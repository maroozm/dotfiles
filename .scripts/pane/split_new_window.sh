
#! /bin/bash
#External rule that always splits the biggest window of the desktop
#Originally copied from https://github.com/ikn/ and 
#modified to use splitting method of https://github.com/baskerville/bspwm/tree/master/examples/external_rules/pseudo_automatic_mode

bwid=$(bspc query -N -n biggest.tiled)
if bspc query -N -n "@/.!automatic" > /dev/null ; then
    echo "node=@/"
else
# only do something if there's already a tiled window on this desktop
if [ -n "$(bspc query -N -n biggest.tiled)" ]; then
    if [ -n "$(bspc query -N -n biggest.tiled.\!automatic)" ]; then
        # we have a presel: use it by choosing the 'target' window
        echo node=biggest.tiled.\!automatic
    else
        # no presel exists: transplant into the biggest window
        if [ -n "$bwid" ] ; then
	wattr wh $bwid | {
		read width height
		if [ $width -gt $height ] ; then
			echo node=biggest.tiled.\!private split_dir=west
		else
			echo node=biggest.tiled.\!private split_dir=south
		fi
	}
fi
     fi
fi
fi
