#!/usr/bin/env bash

DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"
FROMDIR="${PWD}"


cd "${DIR}"
git submodule update --init --recursive
cd "${FROMDIR}"

ln -s -f "${DIR}/_vimrc"  "${HOME}/_vimrc"

vim +NeoBundleInstall +qall

