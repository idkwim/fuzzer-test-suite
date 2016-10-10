#!/bin/bash
# Copyright 2016 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
. $(dirname $0)/../common.sh
set -x
rm -rf $CORPUS
mkdir $CORPUS
[ -e $EXECUTABLE_NAME_BASE ] && ./$EXECUTABLE_NAME_BASE -artifact_prefix=$CORPUS/ -max_total_time=1800 -jobs=$JOBS -workers=$JOBS $CORPUS SEED_CORPUS
grep "AddressSanitizer: heap-buffer-overflow" fuzz-0.log