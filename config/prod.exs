use Mix.Config

config :personal_website, PersonalWebsite.Repo,
  database: "personal_website",
  hostname: "localhost"

config :personal_website, PersonalWebsiteWeb.Endpoint,
  server: true,
  root: ".",
  version: Mix.Project.config[:version],
  cache_static_manifest: "priv/static/cache_manifest.json",
  # force_ssl: [rewrite_on: [:x_forwarded_proto], hsts: true, host: nil],
  cipher_suite: :strong

# Do not print debug messages in production
config :logger, level: :info

# Load secrets from environmental variables.
import_config "prod.secret.exs"
