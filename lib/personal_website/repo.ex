defmodule PersonalWebsite.Repo do
  use Ecto.Repo,
    otp_app: :personal_website,
    adapter: Ecto.Adapters.Postgres
end
