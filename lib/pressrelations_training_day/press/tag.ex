defmodule PressrelationsTrainingDay.Press.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field(:name, :string)
    has_many(:news_tags, PressrelationsTrainingDay.Press.News_Tag)
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
