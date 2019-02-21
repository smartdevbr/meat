defmodule MeatWeb.AuthControllerTest do
  use MeatWeb.ConnCase

  @valid_auth %Ueberauth.Auth{
    provider: :github,
    info: %{
      name: "gustavo",
      email: "gustavo@example.com"
    },
    credentials: %{
      token: "adslkfjdklsafdsaf"
    }
  }

  @invalid_auth %Ueberauth.Auth{
    provider: :github,
    info: %{
      name: nil,
      email: "dsf"
    },
    credentials: %{
      token: "adslkfjdklsafdsaf"
    }
  }

  describe "login and callback" do
    test "authenticate a user", %{conn: conn} do
      conn =
        get(
          assign(conn, :ueberauth_auth, @valid_auth),
          Routes.auth_path(conn, :callback, "github")
        )

      assert get_flash(conn, :info) == "Welcome!!! gustavo"
    end

    test "failed to authenticate", %{conn: conn} do
      conn =
        get(
          assign(conn, :ueberauth_auth, @invalid_auth),
          Routes.auth_path(conn, :callback, "github")
        )

      assert get_flash(conn, :error) == "There was a problem with to login"
    end
  end
end
