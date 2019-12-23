use Mix.Config

# Configure your database
config :personal_website, PersonalWebsite.Repo,
  username: "postgres",
  password: "root",
  database: "personal_website_test",
  hostname: "database",
  show_sensitive_data_on_connection_error: true,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :personal_website, PersonalWebsiteWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :personal_website, :uploads_path, "./uploads"
