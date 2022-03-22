defmodule PressrelationsTrainingDay.Press.News_Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "news_tags" do
    belongs_to(:news, PressrelationsTrainingDay.Press.News)
    belongs_to(:tags, PressrelationsTrainingDay.Press.Tag)
  end

  @doc false
  def changeset(news_tag, attrs) do
    news_tag
    |> cast(attrs, [])
    |> validate_required([])
  end
end
