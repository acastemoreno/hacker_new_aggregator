# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :hacker_news_aggregator, HackerNewsAggregatorWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: HackerNewsAggregatorWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: HackerNewsAggregator.PubSub,
  live_view: [signing_salt: "I+uZO1iu"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :hacker_news_aggregator, HackerNewsAggregator.Aggregator.ApiClient,
  hacker_news_base_url: "https://hacker-news.firebaseio.com/v0"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
