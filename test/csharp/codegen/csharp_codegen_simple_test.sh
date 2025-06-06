#!/bin/bash
# Copyright 2023 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Run this script via bazel test
# It expects that protoc and grpc_csharp_plugin have already been built.

# Simple test - compare generated output to expected files

# shellcheck disable=SC1090

set -x

TESTNAME=simple

# --- begin runfiles.bash initialization v3 ---
# Copy-pasted from the Bazel Bash runfiles library v3.
set -uo pipefail; set +e; f=bazel_tools/tools/bash/runfiles/runfiles.bash
source "${RUNFILES_DIR:-/dev/null}/$f" 2>/dev/null || \
  source "$(grep -sm1 "^$f " "${RUNFILES_MANIFEST_FILE:-/dev/null}" | cut -f2- -d' ')" 2>/dev/null || \
  source "$0.runfiles/$f" 2>/dev/null || \
  source "$(grep -sm1 "^$f " "$0.runfiles_manifest" | cut -f2- -d' ')" 2>/dev/null || \
  source "$(grep -sm1 "^$f " "$0.exe.runfiles_manifest" | cut -f2- -d' ')" 2>/dev/null || \
  { echo>&2 "ERROR: cannot find $f"; exit 1; }; f=; set -e
# --- end runfiles.bash initialization v3 ---

# protoc and grpc_csharp_plugin binaries are supplied as "data" in bazel
PROTOC=$(rlocation "$RLOCATIONPATH_PROTOC")
PLUGIN=$(rlocation "$RLOCATIONPATH_PLUGIN")

# where to find the test data
DATA_DIR=./test/csharp/codegen/${TESTNAME}

# output directory for the generated files
PROTO_OUT=./proto_out
rm -rf ${PROTO_OUT}
mkdir -p ${PROTO_OUT}

# run protoc and the plugin
$PROTOC \
    --plugin=protoc-gen-grpc="$PLUGIN" \
    --csharp_out=${PROTO_OUT} \
    --grpc_out=${PROTO_OUT} \
    -I ${DATA_DIR}/proto \
    ${DATA_DIR}/proto/helloworld.proto

# log the files generated
ls -l ./proto_out

# Verify the output files exist
# First file is generated by protoc.
# Check it exists but don't check the contents.
[ -e ${PROTO_OUT}/Helloworld.cs ] || {
    echo >&2 "missing generated output, expecting Helloworld.cs"
    exit 1
}

# Second file is generated by the plugin.
# Check it exists and check the contents.
[ -e ${PROTO_OUT}/HelloworldGrpc.cs ] || {
    echo >&2 "missing generated output, expecting HelloworldGrpc"
    exit 1
}

DIFFCMD="diff --strip-trailing-cr"

# Diff to check the contents of the generated file
$DIFFCMD ${DATA_DIR}/expected/HelloworldGrpc.cs ${PROTO_OUT}/HelloworldGrpc.cs
# Silence shellcheck as it doesn't allow testing of $? and there isn't an easy
# way around it with a command with several arguments.
# shellcheck disable=SC2181
if [ $? -ne 0 ]
then
    echo >&2 "Generated code does not match for HelloworldGrpc.cs"
    exit 1
fi

# Run one extra command to clear $? before exiting the script to prevent
# failing even when tests pass.
echo "Plugin test: ${TESTNAME}: passed."
