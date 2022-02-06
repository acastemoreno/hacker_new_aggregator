defmodule HackerNewsAggregator.Aggregator.Lifecycle do
  require Logger

  use GenServer
  alias HackerNewsAggregator.Aggregator.Stories

  ## Public functions
  ####

  @scheduled_interval 1000*60*5 #miliseconds

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

  @spec fetch_topstories_and_schedule_work :: list(integer())
  defp fetch_topstories_and_schedule_work() do
    stories_id = Stories.fetch_topstories()
      |> Enum.take(50)
    Logger.info("Got Hacker News top stories")
    Process.send_after(self(), :refresh_topstories, @scheduled_interval)
    stories_id
  end
end
