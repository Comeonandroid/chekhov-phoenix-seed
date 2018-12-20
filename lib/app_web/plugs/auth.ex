defmodule AppWeb.Plugs.Auth do
  use AppWeb, :controller

  def load_current_user(conn, _) do
    conn
    |> assign(:current_user, Guardian.Plug.current_resource(conn))
  end

end
