#!/bin/bash

mkdir -p "$HOME/.config/herbstluftwm/layouts"

herbstclient dump > "$HOME/.config/herbstluftwm/layouts/$1"
