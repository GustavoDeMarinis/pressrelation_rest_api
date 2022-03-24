defmodule PressrelationsTrainingDay.Press.News_Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias PressrelationsTrainingDay.Press

  @primary_key {:news_id, :id, autogenerate: false}
  schema "news_tags" do
    belongs_to :tags, Press.Tag, foreign_key: :tag_id
  end

  @doc false
  def changeset(news_tag, attrs) do
    news_tag
    |> cast(attrs, [:news_id, :tag_id])
    |> validate_required([:news_id, :tag_id])
  end
end
