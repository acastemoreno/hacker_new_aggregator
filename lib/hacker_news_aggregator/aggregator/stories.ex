defmodule HackerNewsAggregator.Aggregator.Stories do
  require Logger

  @base_url "https://hacker-news.firebaseio.com/v0"

  @spec fetch_topstories :: list(integer())
  def fetch_topstories() do
    %HTTPoison.Response{status_code: 200, body: body} =
      HTTPoison.get!("#{@base_url}/topstories.json")

    Jason.decode!(body)
  end
end
