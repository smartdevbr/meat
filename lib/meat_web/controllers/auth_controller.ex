defmodule MeatWeb.AuthController do
    use MeatWeb, :controller
    alias Meat.Accounts
    plug Ueberauth

  def callback(%{assigns: %{ueberauth: auth}} = conn, %{"provider" => provider}) do
    user = %{ name: auth.info.name, token: auth.credentials.token,
    email: auth.info.email, provider: provider }
    Accounts.create_user user
  end

  def logout(conn, params) do
  end
end
