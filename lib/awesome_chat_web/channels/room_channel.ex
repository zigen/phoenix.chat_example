defmodule AwesomeChatWeb.RoomChannel do
  @moduledoc false
  use  AwesomeChatWeb, :channel

  def join("room:general", _message, socket) do
    IO.inspect socket
    {:ok, socket}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    broadcast! socket, "new_msg", %{body: body}
    {:noreply, socket}
  end
end
