defmodule PressrelationsTrainingDay.Press.News do
  use Ecto.Schema
  import Ecto.Changeset
  alias PressrelationsTrainingDay.Press

  @foreign_key_type :interger
  schema "news" do
    field :headline, :string
    field :date, :utc_datetime_usec
    field :publication, :string
    field :text, :string
    has_many :news_tags, Press.News_Tag, references: :id
  end

  @doc false
  def changeset(news, attrs) do
    news
    |> cast(attrs, [:headline, :text, :publication, :date])
  end
end
