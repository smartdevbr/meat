defmodule MeatWeb.AuthController do
    use MeatWeb, :controller
    plug Ueberauth

  def callback(conn, params) do
    IO.inspect(conn)
    IO.puts("-------------------------------------- callback")
    IO.inspect(params)
  end

  def logout(conn, params) do
  end
end
