#!/bin/bash

layout=$(<"$HOME/.config/herbstluftwm/layouts/$1")
herbstclient load "$layout"
