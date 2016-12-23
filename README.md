cegui mirror tool
=================

This is a tool to set up an automatic mirroring of a mercurial repository.

First call `configure_hg.sh`. This will

* install `hg`, `git`, and `hg-git`.
* clone the official cegui repository
* setup the paths to include official and github mirror
* setup two bookmarks, for v0-8 and default branches. A bookmark must
  be created for any branches that will exist in git.

Then, create a local ssh key and install the public key part in both
bitbucket and github so that scripts can run unattended.

Two shell scripts, `hg_push.sh`, and `hg_pull.sh` can be called in regular
intervals to make the github repo track the mercurial repo.

travis
------

The second part of the equation is getting travis working.

Travis requires that we actually place a .travis.yml file into the repository.

But, it doesn't exist in the official repository!

Therefore, for each mirrored branch there is a "+travis" version, which will
have the  travis file. And we use git to continually pull --rebase into these
branches. And push those.

The `configure_git.sh` script sets up this git repository.

It does not set up the "+travis" branches or the .travis.yml file, that must
be done by hand.

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
