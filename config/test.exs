use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :meat, MeatWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
config :arc, storage: Arc.Storage.Local

# Configure your database
config :meat, Meat.Repo,
  username: "postgres",
  password: "1234",
  database: "meat_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
