RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.0)" rbenv install 3.2.2

brew install postgresql@15
brew services restart postgresql@15
brew services restart postgresql
./bin/dev


git push heroku main
heroku logs --tail
heroku run rake db:migrate
heroku run rails console

<!-- TO DO -->
order works by opus number
Add image to elements (cloudinary)
