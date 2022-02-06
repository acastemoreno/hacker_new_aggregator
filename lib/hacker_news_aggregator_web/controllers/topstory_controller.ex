defmodule HackerNewsAggregatorWeb.TopstoryController do
  use HackerNewsAggregatorWeb, :controller

  alias HackerNewsAggregator.Aggregator

  action_fallback HackerNewsAggregatorWeb.FallbackController

  def index(conn, pagination_params) do
    with {:ok, pagination}  <- Aggregator.create_pagination(pagination_params),
      topstories <- Aggregator.get_topstories(pagination) do
      render(conn, "index.json", topstories: topstories)
    end
  end
end
