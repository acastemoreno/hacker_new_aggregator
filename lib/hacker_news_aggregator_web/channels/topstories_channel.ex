defmodule HackerNewsAggregatorWeb.TopStoriesChannel do
  use HackerNewsAggregatorWeb, :channel

  @impl true
  def join("topstories", _message, socket) do
    {:ok, socket}
  end

  @doc """
  Handle pub/sub message sended by HackerNewsAggregator.Aggregator.Lifecycle
  """
  @impl true
  def handle_info({:topstories_refreshed, stories_id}, socket) do
    format = HackerNewsAggregatorWeb.TopstoryView.render("index.json", %{topstories: stories_id})
    broadcast!(socket, "topstories_refreshed", format)
    {:noreply, socket}
  end
end
