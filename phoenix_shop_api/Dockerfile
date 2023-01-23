FROM elixir:1.14-alpine
RUN apk add --update build-base erlang-dev
RUN apk add --update make
RUN apk add --update nodejs npm
RUN mix local.hex --force && mix local.rebar --force

WORKDIR /app

COPY . .
CMD mix deps.get
RUN mix do deps.get, deps.compile
EXPOSE 4000
CMD mix phx.server
