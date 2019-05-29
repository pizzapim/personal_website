defmodule PersonalWebsiteWeb.AuthController do
  use PersonalWebsiteWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"password" => password}) do
    if Argon2.verify_pass(password, System.get_env("ADMIN_PASS_HASH")) do
      conn
      |> put_session("is_admin", true)
      |> redirect(to: "/")
    else
      render(conn, "new.html", errors: [password: {"Password is incorrect.", %{count: 1}}])
    end
  end
end
