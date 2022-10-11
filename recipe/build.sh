# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/libtool/build-aux/config.* .

if [[ "$target_platform" == linux* ]]; then
    export LIBS="-lrt"
fi

./configure --prefix=$PREFIX --with-components=core --libdir=$PREFIX/lib --includedir=$PREFIX/include

# The "-wno-abi" flag is required for PPC64LE; see the link for some discussion.
# https://lists.mcs.anl.gov/pipermail/petsc-dev/2021-June/027496.html
make -j${CPU_COUNT} CFLAGS="-Wno-abi ${CFLAGS}"

# The "check" command should work, but requires the build process to be launched
# by a non-root user, which is currently not supported.
# make check
make install
