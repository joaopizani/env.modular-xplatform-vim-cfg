#!/usr/bin/env bash

DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"


git -C "${DIR}" checkout extra-haskell-coq-agda
git -C "${DIR}" submodule update --init --recursive --remote

ln -s -f "${DIR}/_vimrc"  "${HOME}/_vimrc"

vim +NeoBundleInstall +qall

