#!/bin/bash
grim -g "$(slurp)" -t png ~/satty.png
satty --filename ~/satty.png --early-exit --fullscreen
wl-copy < ~/satty.png
rm ~/satty.png

