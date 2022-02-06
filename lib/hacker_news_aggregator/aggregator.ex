defmodule HackerNewsAggregator.Aggregator do
  alias HackerNewsAggregator.Pagination
  alias HackerNewsAggregator.Aggregator.Lifecycle

  import Ecto.Changeset

  def create_pagination(pagination_params) do
    %Pagination{}
    |> Pagination.changeset(pagination_params)
    |> apply_action(:create)
  end

  def get_topstories(%Pagination{page: page, per_page: per_page}) do
    start_index = (page - 1) * per_page

    GenServer.call(Lifecycle, :get_topstories)
    |> Enum.slice(start_index, per_page)
  end
end
