defmodule AwesomeChatWeb.PageController do
  use AwesomeChatWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
