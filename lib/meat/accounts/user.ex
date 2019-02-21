defmodule Meat.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    field :provider, :string
    field :token, :string
    has_many :restaurants, Meat.Restaurants.Restaurant

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :token, :email, :provider])
    |> validate_required([:name, :token, :email, :provider])
  end
end
