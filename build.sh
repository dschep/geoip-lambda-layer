#!/bin/bash -ex

# Set your license key ENV var before continuing!
# Check license key is correctly set
if [ -z "${MAXMIND_LICENSE_KEY}" ]; then
  set +x
  2>&1 echo '--------------------------------------------'
  2>&1 echo 'You must set the env var MAXMIND_LICENSE_KEY'
  2>&1 echo 'Get your license key from maxmind.com'
  2>&1 echo 'login -> services -> my license key -> new'
  2>&1 echo 'note: can take 5 minutes to become active'
  2>&1 echo '--------------------------------------------'
  exit 1
fi

rm -rf layer
docker build --build-arg MAXMIND_LICENSE_KEY -t geoip-lambda-layer .
CONTAINER=$(docker run -d geoip-lambda-layer false)
docker cp $CONTAINER:/opt layer
docker rm $CONTAINER
touch layer/.slsignore
cat > layer/.slsignore << EOF
**/*.a
**/*.la
share/**
include/**
bin/**
EOF
