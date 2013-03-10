A self-contained, cross-platform, nice  VIM setup
=================================================
During the course of several months, I have been using the mighty VIM editor for work, leisure and everything
in between (mostly stuff related to programming). I collected a lot of tips and tricks, customized my setup
and used a lot of plugins which I find generally very useful for all programmers out there, so I tried my best
to organize my setup and make it the most self-contained and easily-reproducible as possible...

Also, I do my work with Linux and Windows - and I struggled to make my beloved VIM setup work on both platforms
providing an essentially unified experience. After much googling and some head-banging I could achieve
portability, and this VIM setup should work in your machine by just following the simple installation
instructions :)


Basic installation steps
------------------------
### First step - Clone ###
 * Clone this repo to a directory of your preference, let's call this $REPO from now on:

```bash
REPO=~/modular-vim-cfg; git clone http://github.com/joaopizani/modular-xplatform-vim-cfg.git $REPO
```

### Second step - Link (OS-Specific) ###

 * **Linux, BSD, Mac OS X:** Create a link called "\_vimrc" in your home directory
   pointing to the cloned repo:

```bash
ln -s ${REPO}/_vimrc  ~/_vimrc
```

 * **Windows:** Go into `$REPODIR/win` and execute (double-click) the
   file named `install-vimrc-link.bat`

Optional but recommended: enabling the set of recommended plugins
-----------------------------------------------------------------
 1. Go into `$REPO` and run `git submodule update --init`. Congratz! You just enabled
    [NeoBundle](https://github.com/Shougo/neobundle.vim) (a very nice® Vim plugin manager for Vim).

 2. Obtain the set of plugins by running `vim +NeoBundleInstall +qall`

 3. DONE. COMPLETELY DONE. Whenever you want to update the plugins, you can do it **inside**
    Vim by running the command `NeoBundleUpdate`



Some basic usage instructions
-----------------------------
### VERY FREQUENTLY used keymappings ###
The file `modular-xplatform-vim-cfg/config/simple-vimrc.vim` contains, among other niceties, some
convenient keymappings for frequent tasks when developing using Vim (at least I find them convenient).
You can of course edit the file to your liking, but the default mappings are:

 * **F4:** Opens/closes the NERDTree filesystem navigation sidebar.
 * **F5:** Opens/closes the Tagbar navigation sidebar, gives an "outline" of the current file.
 * **F6:** Toggles the *Quickfix* window, i.e, opens it if it's closed and closes it if already open.
 * **F7:** Goes to the next *Quickfix* error (:cn).
 * **F8:** Saves changes to all open buffers (:wa).
 * **F9:** Builds the "project" (issues the "make!" command), **without** jumping to the first error.

**Important:** All abovementioned mappings also work in insert mode.

 * **Ctrl+p:** Opens a prompt for easy most-recently-used and intelligent (fuzzy) file and buffer search

 * **,pp:** Toggles PASTE mode. PASTE mode is useful for when you want to paste formatted text into vim (for
   example, from the web), and don't want vim to mess with it by trying to autoindent or autoformat it.
 * **,hl:** Toggles search highlighting. After doing a search, it can be useful to have all the results
   highlighted, but if you want to toggle this setting, use this short mapping :)
 * **,nn:** Toggles line numbers in the current buffer

### Moving between split windows, resizing and maximizing/restoring them ###
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
 * **\<Ctrl\>w+o:** By pressing this combination, you will maximize the current split to occupy the whole
   screen. By pressing the same combination again, the previous split configuration is completely restored.

### Miscellaneous nice stuff going on under the covers ###
Some nice settings and plugins are in place which make (at least I think) any programmer's life easier while
using Vim, and require no intervention from the user (they just work® by default). A random selection of such
niceties follows:

 * **Segregated Vim metafiles:** Vim has the bad habit of polluting the user's working directory with backup
   files (myfile~), swap files (.myfile.swp), undo files, etc. My config segregates all these files into
   central directories: `modular-xplatform-vim-cfg/runtime/{backup,swap,undo,views}`.

 * **Easy and organized plugin management:** Our setup uses [NeoBundle](https://github.com/Shougo/neobundle.vim),
   the *Mother of All Plugins* for Vim. NeoBundle is like a package manager for Vim plugins. You have a list of your
   installed plugins under `modular-xplatform-vim-cfg/config/vimrc.vim`; you can install and/or update plugins
   by using the command `:NeoBundleUpdate` and uninstall by using `NeoBundleClean`. All plugins are kept under a
   single directory, with one plugin per subdirectory.

 * **Code snippets:** Includes the awesome [neosnippet](https://github.com/Shougo/neosnippet) plugin, which
   allows you to insert short snippets of code by using "trigger" keywords and the Tab key. It's too awesome
   too describe with words: go see the [screencast](http://www.youtube.com/watch?v=TNMjbaimk9g).
   Our setup includes a directory for custom snippets: there are already some there and you can add your own.
   For example: when you type `author<Tab>`, a nice header containing the file author's name and a timestamp
   will be inserted.

 * **Parallel builds:** Combines GNU Make "parallel build" feature with Vim's internal "make" command. As
   described in [this blog post](http://joaopizani.hopto.org/en/2012/05/vim-parallel-make).

 * **Automatic, EASY tags:** By using the [easytags](https://github.com/xolox/vim-easytags), tags are
   generated, regenerated whenever necessary and managed automatically and in a central location. Our
   setup includes settings which fine-tune easytags for an even smoother experience. These
   customizations of the plugin are located in `modular-xplatform-vim-cfg/config/tags.vim`.

 * **Easy-on-the-eyes, 256-colors colorscheme:** Whenever the terminal in which you are running Vim allows,
   we use a very comfortable 256-colors colorscheme, namely, [Zenburn](https://github.com/jnurmine/Zenburn).

 * **Tagbar for outline-like code navigation:** If you have ever used the "outline" feature of heavyweight
   IDEs, you will feel at home with [Tagbar](https://github.com/majutsushi/tagbar). You can show a sidebar
   with an outline of your file (functions, classes, etc.) by pressing F5. Clicking (or pressing Enter)
   over a tag will take you to that part of the code).

