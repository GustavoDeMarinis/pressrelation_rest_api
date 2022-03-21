defmodule PressrelationsTrainingDayWeb.PageController do
  use PressrelationsTrainingDayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
