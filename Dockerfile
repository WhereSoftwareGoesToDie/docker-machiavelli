FROM debian:jessie
MAINTAINER engineering@anchor.net.au

RUN apt-get update && apt-get install -y --no-install-recommends \
	ca-certificates \
	git \
	build-essential \
	wget \
	ruby \
	ruby-dev \
	redis-server \
	openssl \
	unicorn

# Setup Redis as proper service
ADD redis_init.sh /etc/init.d/redis-server
RUN update-rc.d redis-server defaults

RUN gem install bundler

RUN git clone https://github.com/anchor/machiavelli
RUN cd machiavelli && bundle install --without development

ADD start-machiavelli.sh /start-machiavelli.sh

# Uniconr-based setup
ADD unicorn.rb /machiavelli/config/unicorn.rb
RUN mkdir -p /machiavelli/tmp/pids
RUN mkdir -p /machiavelli/tmp/cache
RUN mkdir -p /machiavelli/tmp/sockets
RUN mkdir -p /machiavelli/log

WORKDIR /machiavelli

EXPOSE 80

ENTRYPOINT ["/start-machiavelli.sh"]
