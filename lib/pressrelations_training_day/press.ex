defmodule PressrelationsTrainingDay.Press do
  import Ecto.Query, warn: false
  alias PressrelationsTrainingDay.Repo

  alias PressrelationsTrainingDay.Press.News
  alias PressrelationsTrainingDay.Press.Tag
  alias PressrelationsTrainingDay.Press.News_Tag

  def list_news do
    Repo.all(from new in News, preload: [:news_tags, news_tags: :tags])
  end

  def get_news!(id) do
    news =
      Repo.get!(News, id)
      |> Repo.preload([:news_tags, news_tags: :tags])

    news
  end

  def create_news(attrs \\ %{}) do
    %News{}
    |> News.changeset(attrs)
    |> Repo.insert()
  end

  def update_news(%News{} = news, attrs) do
    news
    |> News.changeset(attrs)
    |> Repo.update()
  end

  def delete_news(%News{} = news) do
    Repo.delete(news)
  end

  def change_news(%News{} = news, attrs \\ %{}) do
    News.changeset(news, attrs)
  end

  def list_tags do
    Repo.all(Tag)
  end

  def get_tag!(id), do: Repo.get!(Tag, id)

  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  def change_tag(%Tag{} = tag, attrs \\ %{}) do
    Tag.changeset(tag, attrs)
  end

  alias PressrelationsTrainingDay.Press.News_Tag

  def list_news_tags do
    Repo.all(News_Tag)
  end

  def get_news_tag!(id), do: Repo.get!(News_Tag, id)

  def create_news_tag(attrs \\ %{}) do
    %News_Tag{}
    |> News_Tag.changeset(attrs)
    |> Repo.insert()
  end

  def update_news_tag(%News_Tag{} = news__tag, attrs) do
    news__tag
    |> News_Tag.changeset(attrs)
    |> Repo.update()
  end

  def delete_news_tag(%News_Tag{} = news__tag) do
    Repo.delete(news__tag)
  end

  def news_tags(%News{news_tags: tags}) do
    Enum.flat_map(tags, &news_tag_press_tags/1)
  end

  def news_tags(_) do
    []
  end

  def news_tag_press_tags(%News_Tag{tags: %Tag{name: name, id: id}}) do
    [%{id: id, name: name}]
  end

  def news_tag_press_tags(_) do
    []
  end

  def change_news_tag(%News_Tag{} = news__tag, attrs \\ %{}) do
    News_Tag.changeset(news__tag, attrs)
  end
end
