defmodule PersonalWebsiteWeb.AuthController do
  use PersonalWebsiteWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"password" => password}) do
    if Argon2.verify_pass(password, "$argon2id$v=19$m=131072,t=8,p=4$03g1ApyJYaF3I5xg5a3LOg$Y1+6y10zdZc6VF+fECYjEy6RukR44h6v5KKfWx/qmZw") do
      conn
      |> put_session("is_admin", true)
      |> redirect(to: "/")
    else
      render(conn, "new.html", errors: [password: {"Password is incorrect.", %{count: 1}}])
    end
  end
end
