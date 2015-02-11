#!/bin/bash
set -e
/etc/init.d/redis-server start

bundle exec unicorn 

exec "$@"
