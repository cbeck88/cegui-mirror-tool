#!/bin/bash

mkdir git
cd git
git clone https://github.com/cbeck88/cegui-mirror-two

cd cegui-mirror-two
git checkout v0-8+travis
git pull --rebase v08
git push origin v0-8+travis

git checkout default+travis
git pull --rebase def
git push origin default+travis
