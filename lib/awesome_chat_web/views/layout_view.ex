defmodule AwesomeChatWeb.LayoutView do
  use AwesomeChatWeb, :view

  def authenticated_user(conn) do
    Plug.Conn.get_session(conn, :authenticated_user)
  end
end
