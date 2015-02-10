#!/bin/bash
set -e

/etc/init.d/redis-server start
#RAILS_ENV=production /usr/bin/unicorn -D -c config/unicorn.rb
bundle exec rails server
