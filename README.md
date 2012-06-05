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
 * Clone this repo to a directory of your preference, let's call this $PARENT\_DIR from now on.
 * The second step is operating system specific. After you're done with the second step, the only
   remaining config - which is OPTIONAL - is to install the recommended plugins.

### Second step on Linux ###

 * Create a link called "\_vimrc" in your $HOME pointing to the cloned repo:
   "ln -s $PARENT\_DIR/modular-xplatform-vim-cfg/config/vimrc.vim $HOME/\_vimrc".

### Second step on Windows ###

 * Go into "$PARENT\_DIR/modular-xplatform-vim-cfg/win" and execute (double-click) the file
   named "install-vimrc-link.bat".


Installing the set of recommended plugins, all at once - OPTIONAL
-----------------------------------------------------------------
 1. cd into $PARENT\_DIR/modular-xplatform-vim-cfg and type "git submodule init && git submodule update".
    You have just added [Vundle](https://github.com/gmarik/vundle) (a very nice® Vim plugin manager)
    to your config, congrats!

 2. Enter vim and type ":BundleInstall"

 3. DONE. COMPLETELY DONE. Some basic usage instructions will be here soon... :)
