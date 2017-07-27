# Create image from ruby official base image
FROM ruby:2.3.4
LABEL maintainer="zhiliang.xing@gmail.com"

# Install essential lib
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Make dir
ENV RAILS_ROOT /var/www/oneclass_library
RUN mkdir -p $RAILS_ROOT

# Set working dir
WORKDIR $RAILS_ROOT

# Add Gemfile
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

COPY config/puma.rb config/puma.rb

# Add whole project
ADD . .
