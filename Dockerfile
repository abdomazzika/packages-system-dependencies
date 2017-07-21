FROM ruby:2.1.9
RUN apt-get update -qq && apt-get install -y build-essential \
                                             mysql-client \
                                             nodejs \
                                             libxml2-dev \
                                             libxslt1-dev \
                                             vim \
                                             less
ENV app /var/app
RUN mkdir -p $app
WORKDIR $app

ENV BUNDLE_GEMFILE=$app/Gemfile \
  BUNDLE_JOBS=6 \
  BUNDLE_PATH=/bundle

ADD ./.docker/entry_point.sh /etc/
ENTRYPOINT "/etc/entry_point.sh"