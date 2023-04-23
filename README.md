brew install postgresql@15
brew services restart postgresql@15
brew services restart postgresql
./bin/dev

git push heroku main
heroku logs --tail
heroku run rake db:migrate
heroku run rails console

<!-- TO DO -->
