#!/bin/bash
set -e
set -x

echo "git rebase travis branches"

cd git/cegui-mirror-two

git fetch origin def v08 v0-8+travis default+travis

git checkout v08
git checkout v0-8+travis
git pull origin
git rebase refs/heads/v08
git push -f origin v0-8+travis

git checkout def
git checkout default+travis
git pull origin
git rebase refs/heads/def
git push -f origin default+travis
