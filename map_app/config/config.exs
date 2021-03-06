# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :map_app,
  ecto_repos: [MapApp.Repo]

# Configures the endpoint
config :map_app, MapAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Wrh06DgZV/NxFzqzluJoUrs0YT7l8p1CK6OLmdAFiaq2t0On8qWOw4DykAK5m/vW",
  render_errors: [view: MapAppWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MapApp.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :map_app, MapApp.Accounts.Guardian,
  issuer: "map_app",
  secret_key: "MVCVqsLikZtYh32vlU8yxNrNQu6RY+3eL3Z1kUFUd5kRGThSLfQrCj1GwmQjBQls"

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
