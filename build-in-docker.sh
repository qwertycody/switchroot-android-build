#!/bin/bash

if [ -z $ROM_NAME ];
then
    echo "Missing ROM_NAME env variable. Expected icosa | foster | foster_tab"
    exit 1
else
    echo "ROM name: $ROM_NAME"
fi

if [ -z $ROM_TYPE ]; then
    echo "Missing ROM_TYPE env variable. Expected zip | images"
    exit 1
else
    echo "ROM type: $ROM_TYPE"
fi

if [ -n $FLAGS ]; then
    echo "Flags: $FLAGS"
fi

mkdir -p ./android/lineage
echo Building $ROM_NAME
docker run --rm -ti -e ROM_NAME=$ROM_NAME -e ROM_TYPE=$ROM_TYPE -e FLAGS=${FLAGS:-""} -v "$PWD"/android:/root/android pablozaiden/switchroot-android-build
