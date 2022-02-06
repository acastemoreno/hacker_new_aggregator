defmodule HackerNewsAggregator.Pagination do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :page, :integer, default: 1
    field :per_page, :integer, default: 10
  end

  def changeset(pagination, attrs) do
    pagination
    |> cast(attrs, [:page, :per_page])
    |> validate_number(:page, greater_than_or_equal_to: 1)
    |> validate_number(:per_page, greater_than_or_equal_to: 10)
  end
end
