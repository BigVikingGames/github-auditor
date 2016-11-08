FROM bigvikinggames/ruby:latest
MAINTAINER Jonathon W. Marshall <jmarshall@bigvikinggames.com>

ADD Gemfile /srv/Gemfile
ADD Gemfile.lock /srv/Gemfile.lock
ADD Rakefile /srv/Rakefile
ADD config /srv/config

WORKDIR /srv

RUN bundle install
