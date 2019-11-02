# Install

Build the docker container (comment out line 12 & 13 of Dockerfile)

```bash
docker-compose build web
```

Initialize a new rails app

```bash
docker-compose run web rails new . --no-deps --database=postgresql
```

Install gems

```bash
docker-compose build web
```

Run

```bash
docker-compose run web
```