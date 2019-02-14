defmodule Meat.Restaurants.Restaurant do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}
  schema "restaurants" do
    field :description, :string
    field :image, Meat.RestaurantUploader.Type
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs \\ %{}) do
    restaurant
    |> cast(attrs, [:image, :name, :description])
    |> validate_required([:image, :name, :description], message: "You have to fill this field")
  end
end
