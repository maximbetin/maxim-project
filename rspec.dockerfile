FROM ruby:alpine

MAINTAINER Maxim Betin <betinmaxim@gmail.com>

# Install additional libraries
RUN apk add build-base ruby-nokogiri

# Install RSpec Capybara, Selenium WebDriver
RUN gem install rspec capybara selenium-webdriver

# The process that should be started
ENTRYPOINT ["rspec"]
