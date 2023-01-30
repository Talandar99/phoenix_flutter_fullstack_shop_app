# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :cors_plug,
  allow_origins: ["http://localhost"],
  allow_methods: ["GET", "POST", "OPTIONS"],
  allow_headers: ["accept", "content-type", "x-requested-with", "x-csrf-token", "authorization"]

config :phoenix, :cors_origins, ["http://localhost"]
config :phoenix, :cors_headers, ["accept", "content-type"]

config :phx_shop_api,
  ecto_repos: [PhxShopApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :phx_shop_api, PhxShopApiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: PhxShopApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PhxShopApi.PubSub,
  live_view: [signing_salt: "Wzhzeqyl"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phx_shop_api, PhxShopApiWeb.Auth.Guardian,
  issuer: "phx_shop_api",
  secret_key: "K43R4+Fiep7WoZrrTKjsixbF3SXBiLDv3wdvr9rbhylpoZ+3mGsjnuFNsUlhdxnY"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
