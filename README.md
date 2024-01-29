# CODEX

Codex is a web application that acts as a musicology database.

## Technology Stack

- **Rails**: 7.1.2
- **Ruby**: 3.2.2
- **Esbuild**: 0.19.8
- **Database**: Postgres
- **Server**: Puma 6.4
- **CSS Framework**: Tailwindcss 3.3.6
- **JavaScript Libraries**: Turbo 8.0.0
- **Background Jobs**: Sidekiq 7.2
- **Cache Store**: Redis 5.0

## Setup Instructions

To get the project running locally:

1. **Build the Docker containers:**
```bash
docker-compose build
docker-compose up
```

2. **Install additional dependencies**
```bash
docker compose exec js bin/rails action_text:install
docker compose exec js yarn add chartkick chart.js
```

## **Access the application:**
http://localhost:8000


## **Common Issues**
If you encounter the error `A server is already running (pid: 1, file: /app/tmp/pids/server.pid), you can resolve it by running:`
```bash
docker compose run web bash -c "rm -f /app/tmp/pids/server.pid"
# or
docker compose exec web bash
rm /app/tmp/pids/server.pid
```

## **Running Tests**
To execute the tests, start by launching the containers:
run `docker compose up` and then:
```bash
./run rspec
# or
docker compose exec -e "RAILS_ENV=test" js bash -c rspec
# or
docker compose exec -e "RAILS_ENV=test" js rspec ./spec/requests/artists_controller.spec
```

6. **Code Linting with ERBLint**
To find and correct linting issues:
Finding issues:
```bash
docker compose exec web bash
erblint --lint-all
```

Autocorrection:
```bash
erblint -a app/views/writings/search_form/_years.html.erb
erblint --lint-all --autocorrect
erblint -la -a
``````
