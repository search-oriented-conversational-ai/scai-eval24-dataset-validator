#!/bin/bash

root=$(dirname $0)/..
pushd $root 2>&1 1> /dev/zero

version=$(cat package.json | jq -r '.version')
echo "Building v$version"

echo -e "\n\n> Update lib"
mkdir -p lib
rm -f lib/scai-eval24-dataset-validator.js lib/scai-eval24-dataset-format.json
wget https://raw.githubusercontent.com/search-oriented-conversational-ai/search-oriented-conversational-ai.github.io/main/_includes/scai-eval24-dataset-format.json -O lib/scai-eval24-dataset-format.json
wget https://raw.githubusercontent.com/search-oriented-conversational-ai/search-oriented-conversational-ai.github.io/main/_includes/scai-eval24-dataset-validator.js -O lib/scai-eval24-dataset-validator.js

echo -e "\n\n> Build"
docker build -t webis/scai-eval24-dataset-validator:$version .

echo -e "\n\n> Test"
docker run --rm -it -v $PWD/data:/data webis/scai-eval24-dataset-validator:$version /data/example.ndjson /dev/stdout \
  | sed -r 's/\x1b.*\[\?25h//' \
  | dos2unix \
  > data/example-validation.txt
diff data/example-validation.txt data/example-expected-validation.txt

popd 2>&1 1> /dev/zero
