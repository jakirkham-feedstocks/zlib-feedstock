#!/bin/bash

export CFLAGS="-Doff64_t=off_t"

./configure --64 --static --shared --prefix=$PREFIX

make
make check
make install

# Remove man files.
rm -rf $PREFIX/share

# Copy license file to the source directory so conda-build can find it.
cp $RECIPE_DIR/license.txt $SRC_DIR/license.txt
