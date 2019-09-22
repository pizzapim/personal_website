# PersonalWebsite

## Requirements
* Docker
* Docker Compose

## Development

* Create `.env` file in root of project and add environmental variables. One per line, in the form `key=value`.
* Use `sudo docker-compose --env-file .env -f docker-compose.yml up -d --build` to build and start the database and elixir container.
* Use `sudo docker exec -it -w /workspace personal_website_web_dev /bin/bash` to login into the elixir container.
* Use `mix deps.get` to get and compile dependencies.
* Use `mix ecto.reset` to setup the database.
* Use `cd assets && npm install && cd ..` to setup npm.
* Use `mix phx.server` to start the application.

## Production
* Use `sudo docker-compose --env-file .env -f docker-compose.yml down` to remove development containers.
* Use `sudo docker-compose --env-file .env.prod -f docker-compose.prod.yml up -d --build` to start the production server.
