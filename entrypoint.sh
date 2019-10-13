#!/bin/sh

mix deps.get
mix ecto.setup
cd assets && npm install && cd ..
mix phx.server
