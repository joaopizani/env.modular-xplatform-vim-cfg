#!/usr/bin/env bash

DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"


cd "${DIR}"
git checkout extra-haskell-coq-agda
git submodule update --init --recursive --remote
cd -

ln -s -f "${DIR}/_vimrc"  "${HOME}/_vimrc"

vim +NeoBundleInstall +qall

