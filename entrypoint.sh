#!/bin/bash
set -e

rm -f /tmp/pids/server.pid
echo "Running database migrations..."

bundle exec rails db:migrate || bundle exec rails db:create db:migrate db:seed
# bundle exec rails db:create db:migrate db:seed

echo "Running database migration is finished"

bundle exec rails s -b 'backend' -p '3030'

exec "$@"