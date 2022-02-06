defmodule HackerNewsAggregatorWeb.TopstoryController do
  use HackerNewsAggregatorWeb, :controller

  alias HackerNewsAggregator.Aggregator

  def index(conn, _params) do
    topstories = Aggregator.get_topstories()
    render(conn, "index.json", topstories: topstories)
  end
end
