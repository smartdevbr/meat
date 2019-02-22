defmodule MeatWeb.AuthController do
  use MeatWeb, :controller
  alias Meat.Accounts
  plug Ueberauth

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, %{"provider" => provider}) do
    user = %{
      name: auth.info.name,
      token: auth.credentials.token,
      email: auth.info.email,
      provider: provider
    }

    login(conn, user)
  end

  defp login(conn, user) do
    case insert_or_find(user) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome!!! #{user.name}")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.restaurant_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "There was a problem with to login")
        |> redirect(to: Routes.restaurant_path(conn, :index))
    end
  end

  defp insert_or_find(user) do
    case Accounts.find_by_email(user.email) do
      nil -> Accounts.create_user(user)
      user -> {:ok, user}
    end
  end

  def logout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.restaurant_path(conn, :index))
  end
end
