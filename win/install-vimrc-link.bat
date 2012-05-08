REM copying the main vimrc config file to your HOME directory
REM and adjusting the paths so that VIM can bootstrap itself correctly.

set WINVIM_DIR=%CD%
cd ..
cd ..
set PARENT_DIR=%CD%
cd %WINVIM_DIR%

@echo off
echo ^
let $VIMROOT_PARENT = "%PARENT_DIR%" ^


let $VIMROOT = expand("$VIMROOT_PARENT") . "\\modular-xplatform-vim-cfg" ^

source $VIMROOT\config\vimrc.vim ^
 > "%HOMEPATH%\_vimrc"
