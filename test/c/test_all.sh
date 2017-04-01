#!/bin/bash

set -e

make clean
make -j

for f in `cat targets.txt`; do
    [[ -x $f && ! -d $f ]]
    echo "========== Running $f =========="
    if ! ./$f; then
        bash debug.bash ./$f
    fi
    echo
done
