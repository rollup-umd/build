#!/usr/bin/env bash
set -e

. <(npx @yeutech-lab/rollup-umd-ci-keys print keys.sh)
PACKAGE_VERSION=$(node -p "require('./package.json').version")

# Initialize all the option variables.
# This ensures we are not contaminated by variables from the environment.
installer=npm
sonar=true

while :; do
  case $1 in
    -y|--yarn)
      installer=yarn
      ;;
    --)              # End of all options.
      shift
      break
      ;;
    -?*)
      printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
      ;;
    *)               # Default case: No more options, so break out of the loop.
      break
  esac

  shift
done

if [[ ! -d node_modules ]] || [[ ! -v TRAVIS_BUILD_ID ]]; then
  if [[ ${installer} = yarn ]]; then
    echo "Installing dependencies with ${installer}"
    [[ $(which yarn) = "" ]] && curl -o- -L https://yarnpkg.com/install.sh | bash
    yarn
  else
    npm install
  fi
fi

npm run build
