import Config

secret_key_base = System.fetch_env!("SECRET_KEY_BASE")
app_port = System.fetch_env!("APP_PORT")
app_hostname = System.fetch_env!("APP_HOSTNAME")
db_user = System.fetch_env!("DB_USER")
db_password = System.fetch_env!("DB_PASSWORD")
db_host = System.fetch_env!("DB_HOST")

config :personal_website, PersonalWebsiteWeb.Endpoint,
  http: [port: String.to_integer(app_port)],
  secret_key_base: secret_key_base

config :personal_website,
  app_port: app_port

config :personal_website,
  app_hostname: app_hostname

# Configure your database
config :personal_website, PersonalWebsite.Repo,
  username: db_user,
  password: db_password,
  database: "personal_website",
  hostname: db_host,
  pool_size: 10
