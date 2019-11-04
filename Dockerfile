FROM ruby

RUN apt-get update && apt-get install -y nodejs --no-install-recommends

RUN gem install rails

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y yarn --no-install-recommends

RUN yarn add webpack webpack-dev-server --dev

RUN bundler install

WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install

CMD ["/bin/bash"]
