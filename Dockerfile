# syntax=docker/dockerfile:1
FROM elixir:alpine AS build

WORKDIR /usr/src/kowch

ENV MIX_ENV prod

RUN mix do local.hex --force, local.rebar --force

COPY mix.exs mix.lock ./

RUN mix do deps.get, deps.compile

COPY . .

RUN mix do compile, release

FROM alpine:3.14

WORKDIR /usr/local

RUN apk add --no-cache ncurses-libs tzdata
ENV TZ Asia/Seoul

COPY --from=build /usr/src/kowch/_build/prod/rel/kowch .

EXPOSE 3000
CMD ["bin/kowch", "start"]

