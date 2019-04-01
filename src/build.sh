#!/usr/bin/env bash
set -e

[[ -v TRAVIS_BUILD_ID ]] && npm install # travis does run npm install for us
npm run build
