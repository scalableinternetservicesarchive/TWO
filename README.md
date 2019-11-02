# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Install from repo (not tested)

Install gems

```bash
docker-compose build web
```

create database
```bash
docker-compose run web rails db:create
```

start the service (and note that there is no app)
```bash
docker-compose up
```

next step: create scaffolding


## Create from Dockerfile and docker-compose.yml

Build the docker container

```bash
# comment out line 12 & 13 of Dockerfile
docker-compose build web
```

Initialize a new rails app (this generates gemfile and gemfile.lock)

```bash
docker-compose run web rails new . --no-deps --database=postgresql
```

Install gems

```bash
# uncomment line 12 & 13 of Dockerfile
docker-compose build web
```

Varify it's working

```bash
docker-compose run web
```

create database
```bash
docker-compose run web rails db:create
```

start the service
```bash
docker-compose up
```

next step: create scaffolding
