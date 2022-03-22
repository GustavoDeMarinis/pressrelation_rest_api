defmodule PressrelationsTrainingDay.PressTest do
  use PressrelationsTrainingDay.DataCase

  alias PressrelationsTrainingDay.Press

  describe "news" do
    alias PressrelationsTrainingDay.Press.News

    import PressrelationsTrainingDay.PressFixtures

    @invalid_attrs %{headline: nil, date: nil, publication: nil, text: nil}

    test "list_news/0 returns all news" do
      news = news_fixture()
      assert Press.list_news() == [news]
    end

    test "get_news!/1 returns the news with given id" do
      news = news_fixture()
      assert Press.get_news!(news.id) == news
    end

    test "create_news/1 with valid data creates a news" do
      valid_attrs = %{
        headline: "some  headline",
        date: "some date",
        publication: "some publication",
        text: "some text"
      }

      assert {:ok, %News{} = news} = Press.create_news(valid_attrs)
      assert news.headline == "some  headline"
      assert news.date == "some date"
      assert news.publication == "some publication"
      assert news.text == "some text"
    end

    test "create_news/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Press.create_news(@invalid_attrs)
    end

    test "update_news/2 with valid data updates the news" do
      news = news_fixture()

      update_attrs = %{
        headline: "some updated  headline",
        date: "some updated date",
        publication: "some updated publication",
        text: "some updated text"
      }

      assert {:ok, %News{} = news} = Press.update_news(news, update_attrs)
      assert news.headline == "some updated  headline"
      assert news.date == "some updated date"
      assert news.publication == "some updated publication"
      assert news.text == "some updated text"
    end

    test "update_news/2 with invalid data returns error changeset" do
      news = news_fixture()
      assert {:error, %Ecto.Changeset{}} = Press.update_news(news, @invalid_attrs)
      assert news == Press.get_news!(news.id)
    end

    test "delete_news/1 deletes the news" do
      news = news_fixture()
      assert {:ok, %News{}} = Press.delete_news(news)
      assert_raise Ecto.NoResultsError, fn -> Press.get_news!(news.id) end
    end

    test "change_news/1 returns a news changeset" do
      news = news_fixture()
      assert %Ecto.Changeset{} = Press.change_news(news)
    end
  end

  describe "tags" do
    alias PressrelationsTrainingDay.Press.Tag

    import PressrelationsTrainingDay.PressFixtures

    @invalid_attrs %{name: nil}

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Press.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Press.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Tag{} = tag} = Press.create_tag(valid_attrs)
      assert tag.name == "some name"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Press.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Tag{} = tag} = Press.update_tag(tag, update_attrs)
      assert tag.name == "some updated name"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Press.update_tag(tag, @invalid_attrs)
      assert tag == Press.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Press.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Press.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Press.change_tag(tag)
    end
  end
end
