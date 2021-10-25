FROM ruby:3
LABEL org.opencontainers.image.authors="toshokan@shojigate.net"
RUN apt-get update && apt-get install -y nodejs npm
RUN npm install -g yarn
WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY package.json .
COPY yarn.lock .
RUN yarn install
COPY . .
RUN bundle exec rails webpacker:compile
ENV RAILS_SERVE_STATIC_FILES=1
CMD ["bundle", "exec", "rails", "server", "-e", "production", "-b", "0.0.0.0"]
