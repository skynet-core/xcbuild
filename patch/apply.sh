#!/usr/bin/env sh

DIR=$(
    cd $(dirname $0);
    pwd
)

ROOT=$(dirname $DIR)

find $DIR ! -name apply.sh -type f -exec sh -c '
f=${0#*patch/}
# f=${f%.patch}
d=${f%/*}
patch -s -N -d "$1/$d" < "$1/patch/$f" 
' {} $ROOT \;