```
docker build -t webis/scai-eval24-dataset-validator .
docker push webis/scai-eval24-dataset-validator
docker run --rm -it -v $PWD/data:/data webis/cai-eval24-dataset-validator /data/example.ndjson /dev/stdout
```
