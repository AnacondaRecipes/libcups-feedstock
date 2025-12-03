#!/usr/bin/env bash

if [[ "$target_platform" == linux* ]]; then
    export LIBS="${LIBS:-} -lrt -L$PREFIX/lib"
fi

./configure --prefix="$PREFIX" --with-components=core --libdir="$PREFIX"/lib --includedir="$PREFIX"/include

make -j"${CPU_COUNT}"

# The "check" command should work, but requires the build process to be launched
# by a non-root user, which is currently not supported.
# make check
make install
