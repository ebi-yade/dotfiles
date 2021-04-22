#!/bin/bash
set -eu

DOTPATH=~/dotfiles/home

cd $DOTPATH

for f in .??*
do
    [ "$f" = ".git" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done
