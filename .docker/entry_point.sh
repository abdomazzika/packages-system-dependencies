#!/bin/bash
bundle check || bundle install

bin/rake db:exists && bin/rake db:migrate || bin/rake db:setup

rm -f /var/app/tmp/pids/server.pid
$COMMAND
cat
