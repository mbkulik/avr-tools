#!/usr/bin/env bash

set -eu -o pipefail
shopt -s failglob

pushd rpmbuild/SOURCES

spectool -g -R avarice.spec

dnf builddep -y avarice.spec

rpmbuild -bs avarice.spec

popd
pushd rpmbuild/SRPMS

rpmbuild --rebuild avarice*.src.rpm

popd
