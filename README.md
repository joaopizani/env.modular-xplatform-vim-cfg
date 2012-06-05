A self-contained, cross-platform, nice  VIM setup
=================================================
During the course of several months, I have been using the mighty VIM editor for work, leisure and everything
in between (mostly stuff related to programming). I collected a lot of tips and tricks, customized my setup
and used a lot of plugins which I find generally very useful for all programmers out there, so I tried my best
to organize my setup and make it the most self-contained and easily-reproducible as possible...

Also, I do my work with Linux and Windows - and I struggled to make my beloved VIM setup work on both platforms
providing an essentially unified experience. After much googling and some head-banging I could achieve
portability, and this VIM setup should work in your machine by just following the installation instructions :)


Basic installation steps
------------------------
 * Clone this repo to a directory of your preference, let's call this $PARENT\_DIR from now on:
   `cd $PARENT_DIR;  git clone http://github.com/joaopizani/modular-xplatform-vim-cfg.git`.

 * The second step is operating system specific. After you're done with the second step, the only
   remaining config - which is OPTIONAL - is to install the recommended plugins.

### Second step on Linux ###

 * Create a link called "\_vimrc" in your $HOME pointing to the cloned repo:
   `ln -s $PARENT\_DIR/modular-xplatform-vim-cfg/config/vimrc.vim $HOME/\_vimrc`.

### Second step on Windows ###

 * Go into "$PARENT\_DIR/modular-xplatform-vim-cfg/win" and execute (double-click) the file
   named "install-vimrc-link.bat".

### Installing the set of recommended plugins, all at once - OPTIONAL ###
 1. cd into $PARENT\_DIR/modular-xplatform-vim-cfg and type `git submodule init && git submodule update`.
    You have just added [Vundle](https://github.com/gmarik/vundle) (a very nice® Vim plugin manager)
    to your config, congratz!

 2. Enter vim and type `:BundleInstall`.

 3. DONE. COMPLETELY DONE.


Some basic usage instructions
-----------------------------

### F-n Keymappings ###
The file `modular-xplatform-vim-cfg/config/simple-vimrc.vim` contains, among other niceties, some
convenient keymappings for frequent tasks when programming using Vim (at least I find them convenient).
You can of course edit the file to your liking, but the default mappings are:

 * **F5:** Opens/closes the NERDTree filesystem navigation sidebar.
 * **F6:** Opens the *Quickfix* window whenever there are errors. If the window is already open and
   has no errors, closes it (:cwindow).
 * **F7:** Goes to the next *Quickfix* error (:cn).
 * **F8:** When editing a source C/C++ file (.c, .cpp, etc.), opens the corresponding header in a split
   window. When editing a header, opens the corresponding source file.
 * **F9:** Saves changes to all open buffers (:wa).
 * **F12:** Builds the "project" (issues the "make!" command), **without** jumping to the first error.

**Important:** All abovementioned mappings also work in insert mode.

### Moving between split windows and resizing them ###
When using Vim for programming, you often end up using a lot of open buffers, shown in split windows spread
across your screen. Thus, we added easy mappings to facilitate moving between and resizing split windows:

**Important:** These bindings will only work in normal mode.

 * **Ctrl+{j,k,h,l}:** Goes, respectively, to the window above, below, to the left and to the right of the
   current one.
 * **Alt+{ArrowUp,ArrowDown,ArrowLeft,ArrowRight}:** By pressing Alt in combination with the arrow keys, you
   are able to resize the current window. The *Up* and *Down* arrows will, respectively, increase and decrease
   the window *height*; while *Right* and *Left* will increase and decrease *width*. This can be
   **non-intuitive**, however: When you are in the topmost window and press Alt+Up, the window will go
   **down** (increase height), and if you are in the rightmost window and press Alt+Right, the window will
   go **left** (increase width).

### Miscellaneous nice stuff going on under the covers ###
Some nice settings and plugins are in place which make (at least I think) any programmer's life easier while
using Vim, and require no intervention from the user (they just work® by default). A random selection of such
niceties follows:

 * **Segregated Vim metafiles:** Vim has the bad habit of polluting the user's working directory with backup
   files (myfile~), swap files (.myfile.swp), undo files, etc. My config segregates all these files into a
   central directory: `modular-xplatform-vim-cfg/runtime/{backup,swap,undo,views}`.

 * **Easy and organized plugin management:** Our setup uses [Vundle](https://github.com/gmarik/vundle), the
   *Mother of All Plugins* for Vim. Vundle is like a package manager for Vim plugins. You have a list of your
   installed plugins under `modular-xplatform-vim-cfg/config/vimrc.vim`; you can install and/or update plugins
   by using the command `:BundleInstall` and uninstall by using `BundleClean`. All plugins are kept under a
   single directory, one plugin per subdirectory.

 * **Code snippets:** Includes the awesome [snipmate](http://vimeo.com/3535418) plugin, which
   allows you to insert short snippets of code by using "trigger" keywords and the Tab key. It's too awesome
   too describe with words: go see the link above for a screencast. Our setup includes a directory with some
   custom snippets: there are already some there and you can add your own. For example: when you type
   `author\<Tab\>`, a nice header containing the file author's name and a timestamp will be inserted.

 * **Parallel builds:** Combines GNU Make "parallel build" feature with Vim's internal "make" command. As
   described in [this blog post](http://joaopizani.hopto.org/en/2012/05/vim-parallel-make).

 * **Automatic, EASY tags:** By using the [easytags](https://github.com/xolox/vim-easytags), tags are
   generated, regenerated whenever necessary and managed automatically and in a central (by filetype)
   location. Our setup includes settings which fine-tune easytags for an even smoother experience. These
   customizations of the plugin are located in `modular-xplatform-vim-cfg/config/tags.vim`.

 * **Easy-on-the-eyes, 256-colors colorscheme:** Whenever the terminal in which you are running Vim allows,
   our setup uses a very comfortable 256 colors colorscheme, namely,
   [Zenburn](https://github.com/jnurmine/Zenburn).

 * **Tagbar for outline-like code navigation:** If you have ever used the "outline" feature of heavyweight
   IDEs, you will feel at home with [Tagbar](https://github.com/majutsushi/tagbar). You can show a sidebar
   with an outline of your file (functions, classes, etc.) by typing ",tb". Clicking (or pressing Enter)
   over a tag will take you to that part of the code).

