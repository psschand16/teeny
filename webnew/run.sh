#!/usr/bin/env bash
set -e
set -x

export NODE_ENV="${NODE_ENV:-development}"

if [ $NODE_ENV == "development" ]; then
  # this runs webpack-dev-server with hot reloading
  sudo npm run start
else
  # build the app and serve it via nginx
  npm run build
  mkdir -p $ROOT/logs/nginx
  nginx -g 'daemon off;' -c $ROOT/app/nginx.conf
  nginx -c $ROOT/app/nginx.conf
fi

# NOTES: If NODE_ENV=development this will run the webpack-development-server, otherwise it will build the app and serve it via nginx. (I got this from a great blog post which I can't for the life of me find anymore)
