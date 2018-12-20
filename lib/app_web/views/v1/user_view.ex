defmodule AppWeb.V1.UserView do
  use AppWeb, :view
  alias AppWeb.V1.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      last_name: user.last_name,
      provider: user.provider,
      first_name: user.first_name,
      password_hash: user.password_hash}
  end
end
