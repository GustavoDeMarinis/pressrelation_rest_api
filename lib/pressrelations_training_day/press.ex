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

  def create_news(%{"tags" => tags} = attrs \\ %{}) do
    news =
      %News{}
      |> Repo.preload(:news_tags)
      |> IO.inspect()
      |> News.changeset(attrs)
      |> Repo.insert()

    {:ok, %News{id: news_id}} = news

    case Enum.empty?(tags) do
      false ->
        tag_id_list = Enum.map(tags, fn tag -> create_tag(tag) end)

        Enum.map(tag_id_list, fn tag_id ->
          create_news_tag(%{tag_id: tag_id, news_id: news_id})
        end)

      true ->
        nil
    end

    IO.inspect(news)
    news
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

  def create_tag(value \\ %{}) do
    tags = Repo.all(Tag)

    case Enum.any?(tags, fn tag -> tag.name == value end) do
      false ->
        {:ok, %Tag{id: tag_id}} =
          %Tag{}
          |> Tag.changeset(%{name: value})
          |> Repo.insert()

        tag_id

      true ->
        matched_tag = Enum.find(tags, fn tag -> tag.name == value end)
        matched_tag.id
    end
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

  def list_news_tags do
    Repo.all(News_Tag)
  end

  def get_news_tag!(id), do: Repo.get!(News_Tag, id)

  def create_news_tag(attrs \\ %{}) do
    IO.inspect(attrs)

    %News_Tag{}
    |> News_Tag.changeset(attrs)
    |> Repo.insert()
  end

  def update_news_tag(%News_Tag{} = news_tag, attrs) do
    news_tag
    |> News_Tag.changeset(attrs)
    |> Repo.update()
  end

  def delete_news_tag(%News_Tag{} = news_tag) do
    Repo.delete(news_tag)
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
