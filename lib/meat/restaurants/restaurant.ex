defmodule Meat.Restaurants.Restaurant do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}
  schema "restaurants" do
    field :description, :string
    field :image, Meat.Restaurants.Image.Type
    field :name, :string
    belongs_to :user, Meat.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs \\ %{}) do
    restaurant
    |> cast(attrs, [:image, :name, :description])
    |> cast_attachments(attrs, [:image])
    |> validate_required([:image, :name, :description], message: "You have to fill this field")
  end
end
