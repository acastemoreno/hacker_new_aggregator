defmodule HackerNewsAggregator.Aggregator.ApiClient do
  require Logger

  @base_url Application.get_env(:hacker_news_aggregator, __MODULE__)[:hacker_news_base_url]

  @spec fetch_topstories :: list(integer())
  def fetch_topstories() do
    %HTTPoison.Response{status_code: 200, body: body} =
      HTTPoison.get!("#{@base_url}/topstories.json")

    Jason.decode!(body)
  end

  def get_story!(id) do
    %HTTPoison.Response{status_code: 200, body: body} =
      HTTPoison.get!("#{@base_url}/item/#{id}.json")

    Jason.decode!(body)
  end
end
