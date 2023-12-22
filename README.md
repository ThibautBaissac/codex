# Project

- Rails 7.1.2
- Ruby 3.2.2
- Esbuild 0.19.8
- Postgres
- Puma 6.4
- Tailwindcss 3.3.6
- Turbo 8.0.0
- Sidekiq 7.2
- Redis 5.0

# Setup
```bash
docker-compose build
docker-compose up
docker compose exec js bin/rails action_text:install
```

Visit: http://localhost:8000


If this error occurs:
`A server is already running (pid: 1, file: /app/tmp/pids/server.pid).``
Run:
`docker compose run web bash -c "rm -f /app/tmp/pids/server.pid"`
or
```bash
docker compose exec web bash
rm /app/tmp/pids/server.pid
```
