set -e

rm -f /tmp/pids/server.pid
echo "Running database migrations..."
bundle exec rails db:migrate 2>/dev/null || bundle exec rails db:create db:migrate db:seed
echo "Running database migration is finished"

exec "$@"