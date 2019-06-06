defmodule PersonalWebsiteWeb.AuthControllerTest do
  use PersonalWebsiteWeb.ConnCase

  describe "when a user visits the auth page" do
    test "the page loads", %{conn: conn} do
      conn = get(conn, "/auth")
      assert html_response(conn, 200) =~ "Authentication"
    end

    test "they are not logged in as admin", %{conn: conn} do
      conn = get(conn, "/auth")
      refute html_response(conn, 200) =~ "Logout"
    end
  end

  describe "when a user logs in as admin" do
    setup [:log_in]

    test "an error is reported if the password is wrong", %{conn: conn} do
      assert html_response(conn, 200) =~ "incorrect"
    end

    test "they can successfully log in with the correct password", %{conn: conn} do
      refute html_response(conn, 302) =~ "incorrect"
    end

    test "they can successfully log out again", %{conn: conn} do
      delete(conn, "/auth")
      assert conn.status == 302

      conn = get(conn, "/auth")
      assert html_response(conn, 200) =~ "Authentication"
    end
  end

  defp log_in(context) do
    password = "sesam"
    System.put_env("ADMIN_PASS_HASH", Argon2.hash_pwd_salt(password))

    conn = cond do
      to_string(context.test) =~ "wrong" ->
        post(context.conn, "/auth", password: "Wrong!")
      true ->
        post(context.conn, "/auth", password: password)
    end

    %{context | conn: conn}
  end
end
