#!/bin/bash
set -e
set -x

mkdir git
cd git
git clone https://github.com/cbeck88/cegui-mirror-two
cd cegui-mirror-two
git remote set-url origin git@github.com:cbeck88/cegui-mirror-two.git
