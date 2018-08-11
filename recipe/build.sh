#!/bin/bash


export CC="${PREFIX}/bin/clang"
export WASMFLAGS="-O3 -nostdlib -nostartfiles -Wl,--no-entry"
export CFLAGS="${CFLAGS} ${WASMFLAGS}"
export CXXFLAGS="${CXXFLAGS} ${WASMFLAGS}"

export CFLAGS="${CFLAGS} -fPIC"
export CXXFLAGS="${CXXFLAGS} -fPIC"

./configure --prefix=${PREFIX}  \
            --shared

make -j${CPU_COUNT} ${VERBOSE_AT}
make check
make install

# Remove man files.
rm -rf $PREFIX/share

# Copy license file to the source directory so conda-build can find it.
cp $RECIPE_DIR/license.txt $SRC_DIR/license.txt
