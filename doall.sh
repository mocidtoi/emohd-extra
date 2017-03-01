#!/bin/bash
BASE_DIR=`dirname $0`
$BASE_DIR/build.sh
$BASE_DIR/remote-install
$BASE_DIR/build-android
$BASE_DIR/build-ios
