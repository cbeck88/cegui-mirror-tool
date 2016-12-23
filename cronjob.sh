#!/bin/bash
set -e

echo "cronjob to update cegui mirror"

./pull_hg.sh
./push_hg.sh
./rebase_git.sh
