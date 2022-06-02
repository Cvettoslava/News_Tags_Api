import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :api_news, ApiNews.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "api_news_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api_news, ApiNewsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "3ffjc5yxkMi87Unw+Xrf1gn92PA6pFwQW/sgB/G9oLjzHIONh7JKGcEsIjTLXOqo",
  server: false

# In test we don't send emails.
config :api_news, ApiNews.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
