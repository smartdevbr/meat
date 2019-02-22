defmodule MeatWeb.RestaurantControllerTest do
  use MeatWeb.ConnCase
  alias Meat.Restaurants

  @create_attrs %{
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

  setup %{conn: conn} do
    user = Meat.AccountsTest.user_fixture()

    
    conn = conn
    |> Plug.Test.init_test_session(user_id: user.id)
    {:ok, conn: conn, restaurant: fixture(:restaurant, user)}
  end

  def fixture(:restaurant, user) do
    {:ok, restaurant} = Restaurants.create_restaurant(@create_attrs, user)
    restaurant
  end

  describe "index" do
    test "list all Restaurants", %{conn: conn} do
      conn = get(conn, Routes.restaurant_path(conn, :index))
      assert html_response(conn, 200) =~ "Please choose a amazing place to review"
    end
  end

  describe "new restaurant" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.restaurant_path(conn, :new))
      assert html_response(conn, 200) =~ "Please insert the datas for a new restaurant"
    end
  end

  describe "create restaurant" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.restaurant_path(conn, :create), restaurant: @create_attrs)
      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.restaurant_path(conn, :show, id)

      conn = get(conn, Routes.restaurant_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Burguer House"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.restaurant_path(conn, :create), restaurant: @invalid_attrs)
      assert html_response(conn, 200) =~ "Please insert the datas for a new restaurant"
    end
  end

  describe "edit restaurant" do
    test "renders form for editing chosen restaurant", %{conn: conn, restaurant: restaurant} do
      conn = get(conn, Routes.restaurant_path(conn, :edit, restaurant))
      assert html_response(conn, 200) =~ "Update Restaurant"
    end
  end

  describe "update restaurant" do
    # setup [:create_restaurant]

    test "redirects when data is valid", %{conn: conn, restaurant: restaurant} do
      conn =
        put(conn, Routes.restaurant_path(conn, :update, restaurant), restaurant: @update_attrs)

      assert redirected_to(conn) == Routes.restaurant_path(conn, :show, restaurant)

      conn = get(conn, Routes.restaurant_path(conn, :show, restaurant))
      assert html_response(conn, 200) =~ "Burguer House updated"
    end

    test "renders errors when data is invalid", %{conn: conn, restaurant: restaurant} do
      conn =
        put(conn, Routes.restaurant_path(conn, :update, restaurant), restaurant: @invalid_attrs)

      assert html_response(conn, 200) =~ "Update Restaurant"
    end
  end

  describe "delete restaurant" do
    # setup [:create_restaurant]

    test "deletes chosen restaurant", %{conn: conn, restaurant: restaurant} do
      conn = delete(conn, Routes.restaurant_path(conn, :delete, restaurant))
      assert redirected_to(conn) == Routes.restaurant_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.restaurant_path(conn, :show, restaurant))
      end
    end
  end

  # defp create_restaurant(_, _) do
  #   restaurant = fixture(:restaurant, )
  #   {:ok, restaurant: restaurant}
  # end
end
