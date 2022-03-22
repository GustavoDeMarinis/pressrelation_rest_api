defmodule PressrelationsTrainingDay.PressFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PressrelationsTrainingDay.Press` context.
  """

  @doc """
  Generate a news.
  """
  def news_fixture(attrs \\ %{}) do
    {:ok, news} =
      attrs
      |> Enum.into(%{
        headline: "some  headline",
        date: "some date",
        publication: "some publication",
        text: "some text"
      })
      |> PressrelationsTrainingDay.Press.create_news()

    news
  end

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> PressrelationsTrainingDay.Press.create_tag()

    tag
  end
end
