defmodule HackerNewsAggregator.Aggregator do
  @moduledoc """
  Single point of contact to fetch Hacker News stories
  """

  alias HackerNewsAggregator.Pagination
  alias HackerNewsAggregator.Aggregator.{TopStories, ApiClient}

  import Ecto.Changeset

  def create_pagination(pagination_params) do
    %Pagination{}
    |> Pagination.changeset(pagination_params)
    |> apply_action(:create)
  end

  def get_topstories(%Pagination{page: page, per_page: per_page}) do
    start_index = (page - 1) * per_page

    GenServer.call(TopStories, :get_topstories)
    |> Enum.slice(start_index, per_page)
  end

  def get_story!(id) do
    ApiClient.get_story!(id)
  end
end
