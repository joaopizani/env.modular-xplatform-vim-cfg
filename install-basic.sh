#!/usr/bin/env bash

DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"


cd "${DIR}"
git submodule update --init --recursive --remote
git submodule foreach --recursive 'git pull'
cd -

ln -s -f "${DIR}/_vimrc"  "${HOME}/_vimrc"

vim +NeoBundleInstall +qall

