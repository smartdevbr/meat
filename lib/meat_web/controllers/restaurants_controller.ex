defmodule MeatWeb.RestaurantsController do
  use MeatWeb, :controller

  alias Meat.Restaurants
  alias Meat.Restaurants.Restaurant

  def index(conn, _), do: render(conn, "index.html", restaurants: Restaurants.list_restaurants())

  def new(conn, _),
    do: render(conn, "new.html", changeset: Restaurants.change_restaurant(%Restaurant{}))

  def create(conn, %{"restaurant" => restaurant_param}) do
    case Restaurants.create_restaurant(restaurant_param) do
      {:ok, restaurant} ->
        conn
        |> put_flash(:info, "Restaurant has created")
        |> redirect(to: Routes.restaurants_path(conn, :show, restaurant))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}),
    do: render(conn, "show.html", restaurant: Restaurants.get_restaurant!(id))

  def edit(conn, %{"id" => id}) do
    restaurant = Restaurants.get_restaurant!(id)
    changeset = Restaurants.change_restaurant(restaurant)
    render(conn, "edit.html", restaurant: restaurant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "restaurant" => restaurant_params}) do
    restaurant = Restaurants.get_restaurant!(id)

    case Restaurants.update_restaurant(restaurant, restaurant_params) do
      {:ok, restaurant} ->
        conn
        |> put_flash(:info, "Restaurant has updated successfully!")
        |> redirect(to: Routes.retaurants_path(conn, :show, restaurant))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", restaurant: restaurant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    restaurant = Restaurants.get_restaurant!(id)
    {:ok, _topico} = Restaurants.delete_restaurant(restaurant)

    conn
    |> put_flash(:info, "Restaurant has deleted successfully!")
    |> redirect(to: Routes.restaurants_path(conn, :index))
  end
end
