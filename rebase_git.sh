#!/bin/bash

echo "git rebase travis branches"

cd git/cegui-mirror-two

git checkout v0-8+travis
git pull --rebase v08
git push origin v0-8+travis

git checkout default+travis
git pull --rebase def
git push origin default+travis
