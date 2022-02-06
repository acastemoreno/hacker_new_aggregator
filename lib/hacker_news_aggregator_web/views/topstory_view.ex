defmodule HackerNewsAggregatorWeb.TopstoryView do
  use HackerNewsAggregatorWeb, :view
  alias HackerNewsAggregatorWeb.TopstoryView

  def render("index.json", %{topstories: topstories}) do
    %{data: render_many(topstories, TopstoryView, "topstory.json")}
  end

  def render("topstory.json", %{topstory: topstory}) do
    %{
      id: topstory
    }
  end
end
