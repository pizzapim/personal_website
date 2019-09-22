# PersonalWebsite

## Development

* Install Docker and Docker Compose.
* Create `.env` file in root of project and add environmental variables. One per line, in the form `key=value`.
* Use `set -e; . .env; set +e` to load the environmental variables.
* Use `sudo docker-compose -d --build` to build and start the database and elixir container.
* Use `sudo docker exec -it personal_website_web_dev /bin/bash` to login into the elixir container.
* Use `mix deps.get` to get and compile dependencies.
* Use `mix ecto.reset` to setup the database.
* Use `cd assets && npm install && cd ..` to setup npm.
* Use `mix phx.server` to start the application.
