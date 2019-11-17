# Setup steps

docker-compose build web

docker-compose run web rails db:migrate

docker-compose run web rails db:seed

docker-compose run web bundle install

docker-compose run web yarn install

rails webpacker:install:react
rails generate react:install

docker-compose up
