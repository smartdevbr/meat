defmodule Meat.RestaurantsTest do
  use Meat.DataCase

  alias Meat.Restaurants

  describe "restaurants" do
    alias Meat.Restaurants.Restaurant

    @valid_attrs %{
      description: "the best burguer",
      image: %Plug.Upload{
        content_type: "image/jpeg",
        filename: "image.jpg",
        path: "test/fixtures/image.jpg"
      },
      name: "Burguer House"
    }
    @update_attrs %{
      description: "the best burguer updated",
      image: %Plug.Upload{
        content_type: "image/jpeg",
        filename: "image.jpg",
        path: "test/fixtures/image.jpg"
      },
      name: "Burguer House updated"
    }
    @invalid_attrs %{description: nil, image: nil, name: nil}

    def restaurant_fixture(attrs \\ %{}) do
      {:ok, restaurant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Restaurants.create_restaurant()

      restaurant
    end

    test "list_restaurants/0 returns all restaurants" do
      restaurant = restaurant_fixture()
      list = Restaurants.list_restaurants()
      [restaurant_return | _tail] = list
      assert Enum.count(list) == 1
      assert restaurant_return.id == restaurant.id
    end

    test "get_restaurant!/1 returns the restaurant with given id" do
      restaurant = restaurant_fixture()
      assert Restaurants.get_restaurant!(restaurant.id).name == restaurant.name
    end

    test "create_restaurant/1 with valid data creates a restaurant" do
      assert {:ok, %Restaurant{} = restaurant} = Restaurants.create_restaurant(@valid_attrs)
      assert restaurant.description == "the best burguer"
      assert restaurant.image.file_name == "image.jpg"
      assert restaurant.name == "Burguer House"
    end

    test "create_restaurant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Restaurants.create_restaurant(@invalid_attrs)
    end

    test "update_restaurant/2 with valid data updates the restaurant" do
      restaurant = restaurant_fixture()

      assert {:ok, %Restaurant{} = restaurant} =
               Restaurants.update_restaurant(restaurant, @update_attrs)

      assert restaurant.description == "the best burguer updated"
      assert restaurant.image.file_name == "image.jpg"
      assert restaurant.name == "Burguer House updated"
    end

    test "update_restaurant/2 with invalid data returns error changeset" do
      restaurant = restaurant_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Restaurants.update_restaurant(restaurant, @invalid_attrs)

      assert restaurant.id == Restaurants.get_restaurant!(restaurant.id).id
    end

    test "delete_restaurant/1 deletes the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, %Restaurant{}} = Restaurants.delete_restaurant(restaurant)
      assert_raise Ecto.NoResultsError, fn -> Restaurants.get_restaurant!(restaurant.id) end
    end

    test "change_restaurant/1 returns a restaurant changeset" do
      restaurant = restaurant_fixture()
      assert %Ecto.Changeset{} = Restaurants.change_restaurant(restaurant)
    end
  end
end
