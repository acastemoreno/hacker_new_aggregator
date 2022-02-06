defmodule HackerNewsAggregator.Aggregator do
  @moduledoc """
  Single point of contact display Hacker News Stories.
  Also responsable to manage aggregator life cycle
  """

  use GenServer
  alias HackerNewsAggregator.Aggregator.Stories

  @spec start_link(any) :: :ignore | {:error, any} | {:ok, pid}
  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  @spec init(list) :: {:ok, list(integer)}
  def init(status) do
    {:ok, status}
  end

  @impl true
  def handle_cast(:refresh_topstories, _state) do
    stories_id = Stories.fetch_top_stories()
    {:noreply, stories_id}
  end

  @impl true
  def handle_call(:get_stories, _from, stories_id) do
    {:reply, stories_id, stories_id}
  end
end
