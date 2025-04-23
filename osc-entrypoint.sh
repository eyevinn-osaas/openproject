#!/bin/sh

if [ ! -z "$OSC_HOSTNAME" ]; then
  echo "Setting OpenProject hostname to $OSC_HOSTNAME"
  export OPENPROJECT_HOST__NAME=$OSC_HOSTNAME
  export OPENPROJECT_HTTPS=true
else
  echo "No OpenProject hostname provided, using default."
  export OPENPROJECT_HTTPS=false
fi
export OPENPROJECT_SECRET_KEY_BASE=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32 ; echo ''`
export OPENPROJECT_SEED_ADMIN_USER_PASSWORD=admin
export OPENPROJECT_SEED_ADMIN_USER_PASSWORD_RESET=true

./bin/rails db:migrate RAILS_ENV=production
./bin/rails db:seed RAILS_ENV=production
/app/docker/prod/entrypoint-slim.sh "$@"
