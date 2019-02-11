defmodule MeatWeb.PageController do
  use MeatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
