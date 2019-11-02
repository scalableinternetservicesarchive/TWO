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

## Install

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

Run

```bash
docker-compose run web
```