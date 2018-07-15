FROM elixir:1.6.6-alpine

RUN apk add --no-cache inotify-tools

WORKDIR /app

COPY ./mix.exs ./mix.lock /app/

RUN mix local.hex --force && mix deps.get

ADD . /app

