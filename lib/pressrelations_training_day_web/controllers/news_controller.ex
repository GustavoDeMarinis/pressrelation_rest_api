defmodule PressrelationsTrainingDayWeb.NewsController do
  use PressrelationsTrainingDayWeb, :controller

  alias PressrelationsTrainingDay.Press
  alias PressrelationsTrainingDay.Press.News

  action_fallback(PressrelationsTrainingDayWeb.FallbackController)

  def index(conn, _params) do
    news = Press.list_news()
    render(conn, "index.json", news: news)
  end

  def create(conn, %{"news" => news_params}) do
    with {:ok, %News{} = news} <- Press.create_news(news_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.news_path(conn, :show, news))
      |> render("show.json", news: news)
    end
  end

  def show(conn, %{"id" => id}) do
    news = Press.get_news!(id)
    render(conn, "show.json", news: news)
  end

  def update(conn, %{"id" => id, "news" => news_params}) do
    news = Press.get_news!(id)

    with {:ok, %News{} = news} <- Press.update_news(news, news_params) do
      render(conn, "show.json", news: news)
    end
  end

  def delete(conn, %{"id" => id}) do
    news = Press.get_news!(id)

    with {:ok, %News{}} <- Press.delete_news(news) do
      send_resp(conn, :no_content, "")
    end
  end
end
