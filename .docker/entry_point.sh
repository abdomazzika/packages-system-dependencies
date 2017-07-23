#!/bin/bash

bundle update && bundle install

bin/rake db:create db:migrate db:schema:load

rm -f /var/app/tmp/pids/server.pid
$COMMAND
cat
