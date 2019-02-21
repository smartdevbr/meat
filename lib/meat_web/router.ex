defmodule MeatWeb.Router do
  use MeatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug MeatWeb.Plug.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MeatWeb do
    pipe_through :browser

    resources "/users", UserController
    resources "/", RestaurantController
  end

  scope "/auth", MeatWeb do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    get "/:provider/logout", AuthController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", MeatWeb do
  #   pipe_through :api
  # end
end
