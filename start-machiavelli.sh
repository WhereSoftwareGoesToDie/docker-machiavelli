/etc/init.d/redis-server start
bundle exec rails server -p 80
#RAILS_ENV=production /usr/bin/unicorn -D -c config/unicorn.rb
