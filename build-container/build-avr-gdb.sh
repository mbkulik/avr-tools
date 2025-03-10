#!/usr/bin/env bash

set -eu -o pipefail
shopt -s failglob

pushd rpmbuild/SOURCES

spectool -g -R avr-gdb.spec

dnf builddep -y avr-gdb.spec

rpmbuild -bs avr-gdb.spec

popd
pushd rpmbuild/SRPMS

rpmbuild --rebuild avr-gdb*.src.rpm

popd
