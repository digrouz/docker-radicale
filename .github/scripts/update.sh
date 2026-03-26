#!/usr/bin/env bash

RADICALE_URL="https://api.github.com/repos/Kozea/Radicale/releases"

FULL_LAST_VERSION=$(curl -SsL ${RADICALE_URL} | \
              jq -r -c '.[] | select( .prerelease == false ) | .tag_name' |\
              head -1 \
              )
LAST_VERSION="${FULL_LAST_VERSION}"

if [ "${LAST_VERSION}" ];then
  sed -i -e "s|RADICALE_VERSION='.*'|RADICALE_VERSION='${LAST_VERSION}'|" Dockerfile*
fi

if output=$(git status --porcelain) && [ -z "$output" ]; then
  # Working directory clean
  echo "No new version available!"
else 
  # Uncommitted changes
  git commit -a -m "update to version: ${LAST_VERSION}"
  git push
fi
