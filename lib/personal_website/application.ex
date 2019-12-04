defmodule PersonalWebsite.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # Calculate admin pass hash and remove password from memory.
    hash = Application.get_env(:personal_website, :admin_pass)
           |> Argon2.hash_pwd_salt()
    Application.put_env(:personal_website, :admin_pass_hash, hash)
    Application.put_env(:personal_website, :admin_pass, nil)

    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      PersonalWebsite.Repo,
      # Start the endpoint when the application starts
      PersonalWebsiteWeb.Endpoint
      # Starts a worker by calling: PersonalWebsite.Worker.start_link(arg)
      # {PersonalWebsite.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PersonalWebsite.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PersonalWebsiteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
