#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const process = require('process');

eval(fs.readFileSync(path.join(__dirname, "..", "lib", "scai-eval24-dataset-validator.js")).toString());

const input = process.argv[process.argv.length - 2];
const output = process.argv[process.argv.length - 1];
const numValidRecords = validateText(fs.readFileSync(input).toString(), console.log);
if (numValidRecords >= 0) {
  fs.writeFileSync(output, "measure {\n key: \"Conversations\"\n value:\"" + numValidRecords + "\"\n}\n");
}

