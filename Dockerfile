FROM ruby:3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /undergraduate-api
WORKDIR /undergraduate-api
COPY Gemfile /undergraduate-api/Gemfile
COPY Gemfile.lock /undergraduate-api/Gemfile.lock
RUN gem install bundler:2.3.3
RUN bundle install

ADD . /undergraduate-api
