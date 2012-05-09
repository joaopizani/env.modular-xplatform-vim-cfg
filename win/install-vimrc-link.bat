@echo off


echo Copying the main vimrc config file to your HOME directory
echo and adjusting the paths so that VIM can bootstrap itself correctly.
echo Also copying ctags.cnf to your HOME so that you have reasonable ctags defaults.

set WINVIM_DIR=%CD%
cd ..
cd ..
set PARENT_DIR=%CD%
cd %WINVIM_DIR%


echo let $VIMROOT_PARENT = '%PARENT_DIR%' >> _vimrc
echo let $VIMROOT = expand("$VIMROOT_PARENT") . '\modular-xplatform-vim-cfg' >> _vimrc
echo source $VIMROOT\config\vimrc.vim >> _vimrc


move _vimrc "%USERPROFILE%\_vimrc"
copy ..\ctags.conf "%USERPROFILE%\ctags.cnf"


echo Job DONE. Now you can just launch VIM normally :)
