defmodule MeatWeb.Router do
  use MeatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MeatWeb do
    pipe_through :browser

    resources "/", RestaurantsController
    # get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", MeatWeb do
  #   pipe_through :api
  # end
end
