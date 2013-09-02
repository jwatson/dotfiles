John Watson's Config Files
==========================

These are the config files I use. I've tried to make things work equally
well on OS X and Linux.

Installation
------------

From scratch:

    $ sudo easy_install pip
    $ pip install virtualenv virtualenvwrapper
    $ mkvirtualenv $USER
    $ pip install paver

After that:

    $ git clone https://github.com/jwatson/dotfiles.git ~/.dotfiles
    $ cd ~/.dotfiles
    $ paver install
