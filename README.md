A self-contained, cross-platform and nicely organized VIM setup :)
==================================================================
During the course of several months, I have been using the mighty VIM editor for work, leisure and everything
in between (mostly stuff related to programming). I collected a lot of tips and tricks, customized my setup
and used a lot of plugins which I find generally very useful for all programmers out there, so I tried my best
to organize my setup and make it the most self-contained and easily-reproducible as possible...

Also, I do my work with Linux and Windows, and I struggled to make my beloved VIM setup
work on all these platforms and provide an essentially unified experience. After much googling and some
head-banging I could achieve portability, and this VIM setup should work in your machine by just following the
installation instructions :)

Installation instructions for Windows are provided in win/README.md. The instructions to install this on Linux
are here, just because they are so simple®.


Basic installation steps
------------------------
 1. Clone this repo to a directory of your preference, let's call this PARENT\_DIR from now on.

 2. Create a link called "\_vimrc" in your $HOME pointing to the cloned repo:
   "ln -s \<PARENT_DIR\>/modular-xplatform-vim-cfg/config/vimrc.vim ~/\_vimrc"

 3. VOILÀ! Now if you want to install the set of plugins (recommended step), go on...

Installing the set of recommended, blessed plugins, all at once
---------------------------------------------------------------
 1. cd into \<PARENT_DIR\>/modular-xplatform-vim-cfg and type "git submodule init && git submodule update".
    You have just added "vundle" (a very nice® Vim plugin manager) to your config, congrats!

 2. Enter vim and type ":BundleInstall"

 3. DONE. COMPLETELY DONE.
