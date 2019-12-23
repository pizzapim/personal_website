# PersonalWebsite

## Requirements
* Docker
* Docker Compose

## Development

* Create `.env` file in root of project and add environmental variables. One per line, in the form `key=value`.
* Use `sudo docker-compose up -d --build` to build and start the database and elixir container.

## Production
* Create `.env.prod` file in root of project and add environmental variables. One per line, in the form `key=value`.
* Use `sudo docker-compose down` to remove development containers.
* Use `sudo docker-compose --env-file .env.prod -f docker-compose.prod.yml up -d --build` to start the production server.
