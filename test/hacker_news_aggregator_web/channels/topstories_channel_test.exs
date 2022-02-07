defmodule HackerNewsAggregatorWeb.TopStoriesChannelTest do
  use HackerNewsAggregatorWeb.ChannelCase

  setup do
    {:ok, _, socket} =
      HackerNewsAggregatorWeb.UserSocket
      |> socket()
      |> subscribe_and_join(HackerNewsAggregatorWeb.TopStoriesChannel, "topstories")

    %{socket: socket}
  end

  test "broadcasts are pushed to the client", %{socket: socket} do
    broadcast_from!(socket, "broadcast", %{"some" => "data"})
    assert_push "broadcast", %{"some" => "data"}
  end

  test "Receive and process pub/sub message to broadcast refreshed topstories" do
    Phoenix.PubSub.broadcast(
      HackerNewsAggregator.PubSub,
      "topstories",
      {:topstories_refreshed, [1,5,3]}
    )

    assert_broadcast "topstories_refreshed", %{data: [%{id: 1}, %{id: 5}, %{id: 3}]}
  end
end
