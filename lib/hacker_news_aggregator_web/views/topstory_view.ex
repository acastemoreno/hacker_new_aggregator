defmodule HackerNewsAggregatorWeb.TopstoryView do
  use HackerNewsAggregatorWeb, :view
  alias HackerNewsAggregatorWeb.TopstoryView

  def render("index.json", %{topstories: topstories}) do
    %{data: render_many(topstories, TopstoryView, "topstory.json")}
  end

  def render("show.json", %{story: story}) do
    %{data: render_one(story, TopstoryView, "story.json")}
  end

  def render("topstory.json", %{topstory: topstory_id}) do
    %{
      id: topstory_id
    }
  end

  def render("story.json", %{topstory: story}) do
    %{
      id: story["id"],
      by: story["by"],
      score: story["score"],
      title: story["title"],
      type: story["type"],
      url: story["url"],
      kids: story["kids"]
    }
  end
end
