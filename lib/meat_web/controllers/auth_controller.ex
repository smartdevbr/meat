defmodule MeatWeb.AuthController do
    use MeatWeb, :controller
    plug Ueberauth

  def callback(%{assigns: %{ueberauth: auth}} = conn, %{"provider" => provider}) do
    %{
    name: auth.info.name,
    token: auth.credentials.token,
    email: auth.info.email,
    provider: provider
    }

  end

  def logout(conn, params) do
  end
end
