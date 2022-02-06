defmodule HackerNewsAggregator.Aggregator.Stories do
  require Logger

  @baseUrl "https://hacker-news.firebaseio.com/v0"

  @spec fetch_topstories :: list(integer())
  def fetch_topstories() do
    %HTTPoison.Response{status_code: 200, body: body} =
      HTTPoison.get!("#{@baseUrl}/topstories.json")

    Jason.decode!(body)
  end
end
