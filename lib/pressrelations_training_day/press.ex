defmodule PressrelationsTrainingDay.Press do
  import Ecto.Query, warn: false
  alias PressrelationsTrainingDay.Repo

  alias PressrelationsTrainingDay.Press.News
  alias PressrelationsTrainingDay.Press.Tag

  def list_news do
    Repo.all(News)
  end

  def get_news!(id), do: Repo.get!(News, id)

  def create_news(attrs \\ %{}) do
    %News{}
    |> News.changeset(attrs)
    |> Repo.insert()
  end

  def update_news(%News{} = news, attrs) do
    IO.inspect("ACAAAAAAAAAAAAAA")
    IO.inspect(news)
    IO.inspect("----------------")
    IO.inspect(attrs)
    IO.inspect("ACAAAAAAAAAAAAAA")

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

  def change_news_tag(%News_Tag{} = news__tag, attrs \\ %{}) do
    News_Tag.changeset(news__tag, attrs)
  end
end
