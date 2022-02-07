defmodule HackerNewsAggregator.Aggregator.ApiClientTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias HackerNewsAggregator.Aggregator.ApiClient

  setup do
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")
    :ok
  end

  describe "fetch_topstories/0" do
    test "it should return fetch_topstories" do
      use_cassette "fetch_topstories" do
        stories_id = [
          30_228_327,
          30_237_457,
          30_228_178,
          30_203_478,
          30_240_428,
          30_241_259,
          30_237_846,
          30_236_123,
          30_236_630,
          30_233_630
        ]

        assert ApiClient.fetch_topstories() |> Enum.take(10) == stories_id
      end
    end
  end

  describe "get_story/1" do
    test "it should return story information" do
      use_cassette "get_story" do
        story_data = %{
          "by" => "jseliger",
          "descendants" => 11,
          "id" => 30_228_327,
          "kids" => [
            30_241_219,
            30_241_193,
            30_241_014,
            30_241_280,
            30_240_629,
            30_240_757,
            30_240_968
          ],
          "score" => 64,
          "time" => 1_644_110_934,
          "title" => "How Japan saved Tokyo's rail network from collapse (part 1, 1945-1982)",
          "type" => "story",
          "url" => "https://seungylee14.substack.com/p/how-japan-saved-tokyos-rail-network"
        }

        assert ApiClient.get_story!(30_228_327) == story_data
      end
    end
  end
end
