defmodule MeatWeb.Plug.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller
  alias MeatWeb.Router.Helpers

  def init(_params) do
  end

  def call(conn, _params) do
    if(conn.assigns[:user]) do
      conn
    else
      conn
      |> put_flash(:error, "You need to be logged!")
      |> redirect(to: Helpers.restaurant_path(conn, :index))
      |> halt
    end
  end
end
