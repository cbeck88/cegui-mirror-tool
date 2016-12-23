#!/bin/bash
set -e

echo "hg push mirror"

cd cegui
hg push mirror
