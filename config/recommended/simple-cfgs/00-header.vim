" Some simple customization that should not depend on plugins.
" Mostly UI tweaks, mappings and segregation of backup files.
" Some mappings trigger plugin actions, but if the plugins are not installed
" you can just avoid using these (few) mappings.


let $VIM_AUXDIR = expand("$VIM_ROOT") . '/runtime/aux'


set nocompatible
filetype plugin indent on

