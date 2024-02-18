# CODEX

Codex is a web application that acts as a musicology database.

## Technology Stack

- **Rails**: 7.1.3
- **Ruby**: 3.2.2
- **Esbuild**: 0.19.8
- **Database**: Postgres
- **Server**: Puma 6.4
- **CSS Framework**: Tailwindcss 3.3.6
- **JavaScript Libraries**: Turbo 8.0.0
- **Background Jobs**: Sidekiq 7.2
- **Cache Store**: Redis 5.0

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

3.  **Access the application:**
http://localhost:8000


4. **Common Issues**
If you encounter the error `A server is already running (pid: 1, file: /app/tmp/pids/server.pid), you can resolve it by running:`
```bash
docker compose run web bash -c "rm -f /app/tmp/pids/server.pid"
# or
docker compose exec web bash
rm /app/tmp/pids/server.pid
```

5. **Running Tests**
To execute the tests, start by launching the containers:
run `docker compose up` and then:
```bash
./run rspec
# or
docker compose exec -e "RAILS_ENV=test" js bash -c rspec
# or
docker compose exec -e "RAILS_ENV=test" js rspec ./spec/requests/artists_controller.spec
```

6. **Mailer**
http://localhost:8000/rails/mailers/password_mailer


7. **Code Linting with ERBLint**
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
```

8. **Google Clood Storage**
To edit "config/credentials.yml.enc" run:
```bash
EDITOR="code --wait" rails credentials:edit
```

9. **Heroku**
heroku login
heroku container:login
docker build -t codex-app --platform linux/amd64 .
docker tag codex-app registry.heroku.com/codex-app/web
docker push registry.heroku.com/codex-app/web
heroku container:release web -a codex-app
heroku logs --tail
heroku run bash
heroku run rails c
heroku run rails db:migrate
