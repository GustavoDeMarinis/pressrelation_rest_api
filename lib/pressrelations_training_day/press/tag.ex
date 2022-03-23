defmodule PressrelationsTrainingDay.Press.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias PressrelationsTrainingDay.Press

  @foreign_key_type :interger
  schema "tags" do
    field :name, :string
    has_many :news_tags, Press.News_Tag, references: :id, on_delete: :nilify_all
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
