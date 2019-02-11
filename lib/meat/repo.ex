defmodule Meat.Repo do
  use Ecto.Repo,
    otp_app: :meat,
    adapter: Ecto.Adapters.Postgres
end
