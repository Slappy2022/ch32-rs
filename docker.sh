#!/bin/bash

set -eux
readonly SCRIPT_DIR="$(
  cd -P "$(dirname "${BASH_SOURCE[0]}")"
  pwd
)"

readonly TAG=svd-gen
readonly DIR=.

main() {
  docker build -t "${TAG}" "${DIR}"
  docker run -it \
    -v "${SCRIPT_DIR}":/src \
    "${TAG}" 
}

main "$@"

