defmodule HackerNewsAggregatorWeb.TopstoryController do
  use HackerNewsAggregatorWeb, :controller

  alias HackerNewsAggregator.Aggregator

  action_fallback HackerNewsAggregatorWeb.FallbackController

  @spec index(Plug.Conn.t(), map()) :: {:error, Ecto.Changeset.t()} | Plug.Conn.t()
  def index(conn, pagination_params) do
    with {:ok, pagination} <- Aggregator.create_pagination(pagination_params),
         topstories <- Aggregator.get_topstories(pagination) do
      render(conn, "index.json", topstories: topstories)
    end
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    story = Aggregator.get_story!(id)
    render(conn, "show.json", story: story)
  end
end
