FROM ubuntu:latest
MAINTAINER Graylog, Inc. <hello@graylog.com>

RUN apt-get update --fix-missing && apt-get -y upgrade
RUN apt-get install -y sudo curl wget unzip git
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
RUN sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN sudo apt-get update
RUN sudo apt-get install -y google-chrome-stable

RUN apt-get install -y ruby ruby-dev build-essential libxml2-dev libffi-dev libz-dev

RUN curl https://chromedriver.storage.googleapis.com/2.30/chromedriver_linux64.zip | funzip > /usr/local/bin/chromedriver && chmod +x /usr/local/bin/chromedriver

RUN addgroup --gid 1100 rspec
RUN adduser --disabled-password --disabled-login --gecos '' --uid 1100 --gid 1100 rspec

RUN gem install --no-ri --no-rdoc bundler

