defmodule PersonalWebsiteWeb.AuthControllerTest do
  use PersonalWebsiteWeb.ConnCase

  test "GET /auth", %{conn: conn} do
    conn = get(conn, "/auth")
    assert html_response(conn, 200) =~ "Authentication"
  end

  test "Admin login/logout", %{conn: conn} do
    conn = get(conn, "/auth")
    refute html_response(conn, 200) =~ "Logout"

    password = "open sesam"
    System.put_env("ADMIN_PASS_HASH", Argon2.hash_pwd_salt(password))

    conn = post(conn, "/auth", password: "Wrong!")
    assert html_response(conn, 200) =~ "incorrect"

    conn = post(conn, "/auth", password: password)
    refute html_response(conn, 302) =~ "incorrect"
  end
end
