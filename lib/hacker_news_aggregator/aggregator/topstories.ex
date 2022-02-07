defmodule HackerNewsAggregator.Aggregator.TopStories do
  require Logger

  use GenServer
  alias HackerNewsAggregator.Aggregator.ApiClient
  alias Phoenix.PubSub

  ## Public functions
  ####

  @scheduled_interval Application.get_env(:hacker_news_aggregator, __MODULE__)[
                        :scheduled_interval
                      ]

  def start_link(_status) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  ## GenServer implementation
  ####

  @impl true
  def init(_status) do
    {:ok, fetch_topstories_and_schedule_work()}
  end

  @impl true
  def handle_info(:refresh_topstories, _state) do
    stories_id = fetch_topstories_and_schedule_work()
    {:noreply, stories_id}
  end

  @impl true
  def handle_call(:get_topstories, _from, stories_id) do
    {:reply, stories_id, stories_id}
  end

  ## Helper functions
  ####

  defp fetch_topstories_and_schedule_work() do
    stories_ids = fetch_topstories()

    Logger.info("Got Hacker News top stories")

    broadcast_topstories(stories_ids)

    schedule_next_fetch()

    stories_ids
  end

  defp fetch_topstories() do
    ApiClient.fetch_topstories() |> Enum.take(50)
  end

  defp broadcast_topstories(stories_ids) do
    PubSub.broadcast(
      HackerNewsAggregator.PubSub,
      "topstories",
      {:topstories_refreshed, stories_ids}
    )
  end

  defp schedule_next_fetch() do
    Process.send_after(self(), :refresh_topstories, @scheduled_interval)
  end
end
