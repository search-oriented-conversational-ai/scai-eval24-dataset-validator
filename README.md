# SCAI Eval 2024 Dataset Validator

This repository contains code for validating datasets submitted to SCAI Eval 2024.

The files `lib/scai-eval24-dataset-validator.js` and `lib/scai-eval24-dataset-format.json` are fetched from the online validator when calling [build.sh](bin/build.sh).

## Local Usage
```bash
./bin/build.sh
version=$(jq -r '.version' package.json)
docker run --rm -it -v </path/to/directory/with/dataset>:/data webis/scai-eval24-dataset-validator:$version /data/<dataset-file-name> /dev/zero
```

## TIRA Usage
Command in TIRA:
```bash
node /app/bin/scai-eval24-dataset-validator $inputRun/* $outputDir/validation.prototext
```

Update:
- First increase the version in the [package.json](package.json), usually the minor version
- Then use `./bin/build.sh` to build the new Docker image and test it on the [example.ndjson](data/example.ndjson)
- Then use `./bin/publish.sh` to push to Dockerhub
- Then update the version number in TIRA

