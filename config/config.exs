# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :meat,
  ecto_repos: [Meat.Repo]

# Configures the endpoint
config :meat, MeatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oGxTiUdQm4jvvi2pTSsCheo0K59iJr2v9y3BHPUaY2Lzzf0yVXpzZcL5Y4adzaeH",
  render_errors: [view: MeatWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Meat.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "9924b71e991b23ebb4bc",
  client_secret: "a88afab5fc905e40de0ceba6b222288e30fc42ac"

config :arc, storage: Arc.Storage.Local

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
