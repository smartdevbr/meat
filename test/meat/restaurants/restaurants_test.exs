defmodule Meat.RestaurantsTest do
  use Meat.DataCase

  # alias Meat.Restaurants

  # describe "restaurants" do
  #   alias Meat.Restaurants.Restaurant

  #   @valid_attrs %{description: "some description",
  #   image: %Plug.Upload{
  #     content_type: "image/jpeg",
  #     filename: "download.jpg",
  #     path: "C:\\Users\\OLIVEI~1.GUS\\AppData\\Local\\Temp/plug-1550/multipart-1550134669-391317950165426-6"
  #   },
  #   name: "some name"}
  #   @update_attrs %{
  #     description: "some updated description",
  #     image: %Plug.Upload{
  #       content_type: "image/jpeg",
  #       filename: "download.jpg",
  #       path: "C:\\Users\\OLIVEI~1.GUS\\AppData\\Local\\Temp/plug-1550/multipart-1550134669-391317950165426-6"
  #     },
  #     name: "some updated name"
  #   }
  #   @invalid_attrs %{description: nil, 
  #   image: %Plug.Upload{
  #     content_type: "image/jpeg",
  #     filename: "ss",
  #     path: "-391317950165426-6"
  #   }, name: nil}

  #   def restaurant_fixture(attrs \\ %{}) do
  #     {:ok, restaurant} =
  #       attrs
  #       |> Enum.into(@valid_attrs)
  #       |> Restaurants.create_restaurant()

  #     restaurant
  #   end

  #   test "list_restaurants/0 returns all restaurants" do
  #     restaurant = restaurant_fixture()
  #     assert Restaurants.list_restaurants() == [restaurant]
  #   end

  #   test "get_restaurant!/1 returns the restaurant with given id" do
  #     restaurant = restaurant_fixture()
  #     assert Restaurants.get_restaurant!(restaurant.id) == restaurant
  #   end

  #   test "create_restaurant/1 with valid data creates a restaurant" do
  #     assert {:ok, %Restaurant{} = restaurant} = Restaurants.create_restaurant(@valid_attrs)
  #     assert restaurant.description == "some description"
  #     assert restaurant.image ==  %{file_name: "download.jpg", updated_at: ~N[2019-02-14 08:57:49]}
  #     assert restaurant.name == "some name"
  #   end

  #   test "create_restaurant/1 with invalid data returns error changeset" do
  #     assert {:error, %Ecto.Changeset{}} = Restaurants.create_restaurant(@invalid_attrs)
  #   end

  #   test "update_restaurant/2 with valid data updates the restaurant" do
  #     restaurant = restaurant_fixture()

  #     assert {:ok, %Restaurant{} = restaurant} =
  #              Restaurants.update_restaurant(restaurant, @update_attrs)

  #     assert restaurant.description == "some updated description"
  #     assert restaurant.image == "some updated image"
  #     assert restaurant.name == "some updated name"
  #   end

  #   test "update_restaurant/2 with invalid data returns error changeset" do
  #     restaurant = restaurant_fixture()

  #     assert {:error, %Ecto.Changeset{}} =
  #              Restaurants.update_restaurant(restaurant, @invalid_attrs)

  #     assert restaurant == Restaurants.get_restaurant!(restaurant.id)
  #   end

  #   test "delete_restaurant/1 deletes the restaurant" do
  #     restaurant = restaurant_fixture()
  #     assert {:ok, %Restaurant{}} = Restaurants.delete_restaurant(restaurant)
  #     assert_raise Ecto.NoResultsError, fn -> Restaurants.get_restaurant!(restaurant.id) end
  #   end

  #   test "change_restaurant/1 returns a restaurant changeset" do
  #     restaurant = restaurant_fixture()
  #     assert %Ecto.Changeset{} = Restaurants.change_restaurant(restaurant)
  #   end
  # end
end
