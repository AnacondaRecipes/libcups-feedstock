if [[ "$target_platform" == linux* ]]; then
    export LIBS="-lrt"
fi

./configure --prefix=$PREFIX --with-components=core --libdir=$PREFIX/lib --includedir=$PREFIX/include
make -j${CPU_COUNT}
make check
make install
