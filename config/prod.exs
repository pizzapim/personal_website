use Mix.Config

config :personal_website, PersonalWebsiteWeb.Endpoint,
  load_from_system_env: true,
  url: [host: Application.get_env(:personal_website, :app_hostname),
        port: Application.get_env(:personal_website, :app_port)],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Do not print debug messages in production
config :logger, level: :info

# Which server to start per endpoint:
config :personal_website, PersonalWebsiteWeb.Endpoint, server: true

config :personal_website, :uploads_path, "/home/app/uploads"
