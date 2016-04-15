#!/bin/bash

init() {
  apt-get update
  apt-get install git tmux htop -y
}

install_dependencies() {
  echo "Preparing to install dependencies"
  apt-get install cmake ninja-build clang python uuid-dev libicu-dev icu-devtools \
    libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config -y
apt-get install clang-3.6 -y
update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.6 100
update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100
}

fetch_source() {
  echo "Preparing to fetch source"
  src_directory=$HOME/src/github.com/apple/
  mkdir -p $src_directory
  cd $src_directory
  git clone https://github.com/ninja-build/ninja.git &
  git clone https://github.com/apple/swift.git
  cd swift
  utils/update-checkout --clone &
}

main() {
  init
  install_dependencies
  fetch_source

  echo "We are ready to build, maybe?"
  echo utils/build-script --xctest --foundation -t
  echo "Remember to update your PATH variable to something like \$PATH=\$HOME/src/github.com/apple/build/Ninja-ReleaseAssert/swift-linux-x86_64/bin:\"\$PATH\""
}

main
