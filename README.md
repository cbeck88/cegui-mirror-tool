cegui mirror tool
=================

This is a tool to set up an automatic mirroring of a mercurial repository.
Specifically it's set up for cegui, but it could be adapted.

overview
--------

The basic idea is to have a github mirror of a bitbucket hg repository.

To do that we have:

- One local mercurial clone of official bitbucket repository
- Install `hg-git` mercurial plugin, and bookmarks plugin
- Bookmark the branches that you want to be tracked remotely
- Install ssh keys so that this server can pull and push unattended.

Then, put `hg_push.sh` and `hg_pull.sh` in a cron job or something.

The second part of the idea is to have travis running on the git mirror.

To do that we have

- One local git clone of mirror repository
- An extra "+travis" branch for each tracked branch. The +travis branch has
  a .travis.yml file. (Set this up manually. There is a sample .travis.yml.)

Then, put `rebase_git.sh` in a cron job. This will pull the tracked branches
from the mirror repository to the local git repo, checkout the +travis 
ranches, rebase them against the tracked branches (putting the .travis.yml
commit to the top) and push the rebased branches with force to github. This
push-force command will trigger travis to build.

details
-------

First call `configure_hg.sh`. This will

* install `hg`, `git`, and `hg-git`.
* clone the official cegui repository
* setup the paths to include official and github mirror
* setup two bookmarks, for v0-8 and default branches. A bookmark must
  be created for any branches that will exist in git.

Then, set up ssh keys.

The `hg_push.sh` and `hg_pull.sh` scripts should work at that point.

Then call `configure_git.sh`. This will

* clone the mirror repository
* set up remote tracking branches

The `rebase_git.sh` script should work at that point *if* you set up the
+travis branches manually correctly.

branches
--------

For technical reasons, the branches we end up with have to have stupid names.

* `v08` - tracks official `v0-8`
* `def` - tracks official `default`
* `v0-8+travis` - v08 plus travis.yml file
* `default+travis` - def plus travis.yml file

usage
-----

After running the configure of the two local repos, and setting up a travis yml
file and branches if that doesn't already exist, the three shell scripts

* `pull_hg.sh`
* `push_hg.sh`
* `rebase_git.sh`

should be called in regular intervals, by a cronjob or something.

You don't want for them to run simultaneously in parallel. So, there is one
script `cronjob.sh` which calls them consecutively.
