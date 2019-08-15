# In this file, we load production configuration and
# secrets from environment variables. You can also
# hardcode secrets, although such is generally not
# recommended and you have to remember to add this
# file to your .gitignore.
use Mix.Config

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :personal_website, PersonalWebsiteWeb.Endpoint,
  http: [:inet6, port: {:system, "PORT"}],
  secret_key_base: secret_key_base,
  url: [host: System.get_env("HOST_NAME")],
  https: [
    port: {:system, "PORTSSL"},
    otp_app: :personal_website,
    keyfile: System.get_env("SSL_KEY_FILE_PATH"),
    certfile: System.get_env("SSL_CERT_PATH"),
    cacertfile: System.get_env("SSL_INTERMDTE_CERT_PATH"),
  ]

config :personal_website, PersonalWebsite.Repo,
  username: System.get_env("DB_USER"),
  password: System.get_env("DB_PASSWORD")
