#!/bin/bash

mix local.hex --force
mix deps.get --force
mix ecto.create
mix ecto.migrate
cd assets
npm install
nohup npm run watch &
cd -
iex -S mix phx.server
