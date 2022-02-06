defmodule HackerNewsAggregator.Aggregator.Stories do
  @moduledoc """
  Module responsable to collect Hacker News Stories
  """
  require Logger

  @baseUrl "https://hacker-news.firebaseio.com/v0asd"

  @spec fetch_top_stories :: list(integer)
  def fetch_top_stories do
    # case HTTPoison.get("#{@baseUrl}/topstories.json") do
    #   {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
    #     Jason.decode(body)
    #   {:ok, %HTTPoison.Response{status_code: status_code, body: body}} ->
    #     Logger.error("Hacker News Request Error - HTTP status #{status_code} with body #{body}")
    #     {:error, "Hacker News Request Error"}
    #   {:error, %HTTPoison.Error{reason: reason}} ->
    #     Logger.error(reason)
    #     {:error, "Hacker News Request Error"}
    # end
    %HTTPoison.Response{status_code: 200, body: body} =
      HTTPoison.get!("#{@baseUrl}/topstories.json")

    Jason.decode!(body)
  end
end
