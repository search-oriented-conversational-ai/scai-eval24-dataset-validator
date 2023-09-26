#!/bin/bash

root=$(dirname $0)/..
pushd $root 2>&1 1> /dev/zero

version=$(cat package.json | jq -r '.version')
echo "Publishing v$version"

docker push webis/scai-eval24-dataset-validator:$version

popd 2>&1 1> /dev/zero
