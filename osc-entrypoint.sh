#!/bin/sh

if [ ! -z "$OSC_HOSTNAME" ]; then
  echo "Setting OpenProject hostname to $OSC_HOSTNAME"
  export OPENPROJECT_HOST__NAME=$OSC_HOSTNAME
  export OPENPROJECT_HTTPS=true
else
  echo "No OpenProject hostname provided, using default."
  export OPENPROJECT_HTTPS=false
fi
./bin/rails db:migrate RAILS_ENV=production
/app/docker/prod/entrypoint-slim.sh "$@"
