FROM elixir:1.6

WORKDIR /usr/src/app
COPY mix.exs /usr/src/app/
COPY mix.lock /usr/src/app/
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get update -qq && \
  apt-get install -y build-essential libpq-dev nodejs inotify-tools && \
  mix local.hex --force && \
  mix deps.get --force

