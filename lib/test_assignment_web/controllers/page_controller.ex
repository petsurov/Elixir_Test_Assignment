defmodule TestAssignmentWeb.PageController do
  use TestAssignmentWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
