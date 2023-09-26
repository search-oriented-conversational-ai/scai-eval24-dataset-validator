FROM node:20

COPY . /app
WORKDIR /app
RUN npm install

ENTRYPOINT [ "node", "bin/scai-eval24-dataset-validator" ]
