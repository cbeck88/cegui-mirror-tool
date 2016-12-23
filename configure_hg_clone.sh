#!/bin/bash
set -e

sudo apt-get install hg python-setuptools
sudo easy_install hg-git

touch ~/.hgrc
echo "[extensions]
hgext.bookmarks =
hggit = " >> ~/.hgrc

hg clone https://bitbucket.org/cegui/cegui

cd cegui
touch .hg/hgrc
echo "[paths]
official = ssh://hg@bitbucket.org/cegui/cegui
mirror = git+ssh://git@github.com/cbeck88/cegui-mirror.git" >> .hg/hgrc

hg bookmark -r default def
hg bookmark -r v0-8 v08

echo "Now go set up an ssh key on this server, and install it in mercurial and github accounts!"
