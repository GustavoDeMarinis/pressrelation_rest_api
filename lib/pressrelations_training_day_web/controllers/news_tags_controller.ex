defmodule PressrelationsTrainingDayWeb.News_TagsController do
  use PressrelationsTrainingDayWeb, :controller

  alias PressrelationsTrainingDay.Press
  alias PressrelationsTrainingDay.Press.News_Tag

  def create(conn, %{"news_id" => news_id, "tags_id" => tags_id}) do
    news = Repo.get()
  end
end
