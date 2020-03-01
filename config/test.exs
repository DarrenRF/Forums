use Mix.Config

config :forum, Forum.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn

config :forum, Forum.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "forum_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
