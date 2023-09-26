#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const process = require('process');

const format = JSON.parse(fs.readFileSync(path.join(__dirname, "..", "lib", "scai-eval24-dataset-format.json")).toString());
eval(fs.readFileSync(path.join(__dirname, "..", "lib", "scai-eval24-dataset-validator.js")).toString());

const input = process.argv[process.argv.length - 2];
const output = process.argv[process.argv.length - 1];

function logMethod(text, lineNumber = undefined) {
  if (lineNumber === undefined) {
    console.log(text);
  } else {
    logMethod("Line " + lineNumber + ": " + text);
  }
}
const numValidRecords = validateText(fs.readFileSync(input).toString(), logMethod);
if (numValidRecords >= 0) {
  fs.writeFileSync(output, "measure {\n key: \"Conversations\"\n value:\"" + numValidRecords + "\"\n}\n");
}

