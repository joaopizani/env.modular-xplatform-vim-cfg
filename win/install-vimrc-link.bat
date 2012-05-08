@echo off


echo Copying the main vimrc config file to your HOME directory
echo and adjusting the paths so that VIM can bootstrap itself correctly.

set WINVIM_DIR=%CD%
cd ..
cd ..
set PARENT_DIR=%CD%
cd %WINVIM_DIR%

set TARGET="C:%HOMEPATH%\_vimrc"



echo let $VIMROOT_PARENT = '%PARENT_DIR%' >> _vimrc
echo let $VIMROOT = expand("$VIMROOT_PARENT") . '\modular-xplatform-vim-cfg' >> _vimrc
echo source $VIMROOT\config\vimrc.vim >> _vimrc

move _vimrc %TARGET%


echo Job DONE. Now you can just launch VIM normally :)