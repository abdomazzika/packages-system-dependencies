FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential \
                                             mysql-client \
                                             nodejs \
                                             libxml2-dev \
                                             libxslt1-dev \
                                             vim \
                                             less
RUN mkdir /myapp
WORKDIR /myapp
ADD . /myapp
RUN gem install bundler

ENTRYPOINT "/myapp/.docker/entry_point.sh"