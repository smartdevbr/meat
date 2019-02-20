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

      def fixture(:restaurant) do
          {:ok, restaurant} = Restaurants.create_restaurant(@create_attrs)
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

end
 
      

      
    #     describe "edit test" do
    #       setup [:create_test]
      
    #       test "renders form for editing chosen test", %{conn: conn, test: test} do
    #         conn = get(conn, Routes.test_path(conn, :edit, test))
    #         assert html_response(conn, 200) =~ "Edit Test"
    #       end
    #     end
      
    #     describe "update test" do
    #       setup [:create_test]
      
    #       test "redirects when data is valid", %{conn: conn, test: test} do
    #         conn = put(conn, Routes.test_path(conn, :update, test), test: @update_attrs)
    #         assert redirected_to(conn) == Routes.test_path(conn, :show, test)
      
    #         conn = get(conn, Routes.test_path(conn, :show, test))
    #         assert html_response(conn, 200) =~ "some updated name"
    #       end
      
    #       test "renders errors when data is invalid", %{conn: conn, test: test} do
    #         conn = put(conn, Routes.test_path(conn, :update, test), test: @invalid_attrs)
    #         assert html_response(conn, 200) =~ "Edit Test"
    #       end
    #     end
      
    #     describe "delete test" do
    #       setup [:create_test]
      
    #       test "deletes chosen test", %{conn: conn, test: test} do
    #         conn = delete(conn, Routes.test_path(conn, :delete, test))
    #         assert redirected_to(conn) == Routes.test_path(conn, :index)
    #         assert_error_sent 404, fn ->
    #           get(conn, Routes.test_path(conn, :show, test))
    #         end
    #       end
    #     end
      
    #     defp create_test(_) do
    #       test = fixture(:test)
    #       {:ok, test: test}
    #     end
    #   end
      