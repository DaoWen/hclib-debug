#!/bin/bash

set -e

run_tests() {
    for test_dir in c cpp; do
        printf "\n>>>>>>>>> Testing %s strategy: %s <<<<<<<<<\n\n" $1 $test_dir
        pushd ./test/$test_dir
        ./test_all.sh
        popd
    done
}

if ! [ -d ./scripts -a -f ./install.sh ]; then
    cat <<EOI
ERROR! This script should be run from the HClib project root directory.
Sample usage: ./scripts/run-test-matrix.sh
EOI
    exit 1
elif [ -z "$HCLIB_ROOT" ]; then
    echo 'Missing $HCLIB_ROOT environment variable'
    exit 1
elif ! [ -d $HCLIB_ROOT ]; then
    echo "HClib installation not found at \$HCLIB_ROOT: $HCLIB_ROOT"
    exit 1
fi

# Test default build settings
run_tests default

default_opts='-DHCLIB_WORKER_OPTIONS=HCLIB_WORKER_OPTIONS_HELP_FINISH'
def_prefix='HCLIB_WORKER_STRATEGY'

for strategy in FIXED FIBERS THREADS; do
    printf "\n>>>>>>>>> Building %s strategy <<<<<<<<<\n\n" $strategy
    export USER_CFLAGS="-D$def_prefix=${def_prefix}_$strategy $default_opts"
    make -C compileTree clean install
    run_tests $strategy
done

printf '\nTest matrix result: SUCCESS\n\n'

