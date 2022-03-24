defmodule PressrelationsTrainingDayWeb.TagController do
  use PressrelationsTrainingDayWeb, :controller

  alias PressrelationsTrainingDay.Press
  alias PressrelationsTrainingDay.Press.Tag

  action_fallback PressrelationsTrainingDayWeb.FallbackController

  def index(conn, _params) do
    tags = Press.list_tags()
    render(conn, "index.json", tags: tags)
  end

  def create(conn, %{"tag" => tag_params}) do
    with {:ok, %Tag{} = tag} <- Press.create_tag(tag_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tag_path(conn, :show, tag))
      |> render("show.json", tag: tag)
    end
  end

  def show(conn, %{"id" => id}) do
    tag = Press.get_tag!(id)
    render(conn, "show.json", tag: tag)
  end

  def update(conn, %{"id" => id, "tag" => tag_params}) do
    tag = Press.get_tag!(id)

    with {:ok, %Tag{} = tag} <- Press.update_tag(tag, tag_params) do
      render(conn, "show.json", tag: tag)
    end
  end

  def delete(conn, %{"id" => id}) do
    tag = Press.get_tag!(id)

    with {:ok, %Tag{}} <- Press.delete_tag(tag) do
      send_resp(conn, :no_content, "")
    end
  end
end
