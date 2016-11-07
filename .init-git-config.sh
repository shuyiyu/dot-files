#!/bin/bash

git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -l HEAD'
git config --global alias.visual '!gitk'

git config --global alias.am 'commit -am'

git config --global alias.up '!git pull --rebase --prune $@ && git submodule update --init --recursive'

git config --global alias.undo 'reset HEAD~1 --mixed'
git config --global alias.amend 'commit -a --amend'
git config --global alias.this 'rev-parse --abbrev-ref HEAD'

git config --global alias.dw 'diff --word-diff'
git config --global alias.dc 'diff --cached'
git config --global alias.root 'rev-parse --show-toplevel'
git config --global alias.conf 'config --global -e'

