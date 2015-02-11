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

ADD docker-entrypoint.sh /entrypoint.sh

WORKDIR /machiavelli

EXPOSE 8080

ENV RAILS_ENV production
RUN cd /machiavelli && /etc/init.d/redis-server start && bundle exec rake assets:precompile

ENTRYPOINT ["/entrypoint.sh"]

