defmodule AppWeb.V1.Auth.SessionView do
  use AppWeb, :view

  def render("sign_in.json", %{user: user, token: token, refresh: refresh}) do
    %{
      status: :ok,
      data: %{
        user: Map.merge(
          render_one(user, AppWeb.V1.UserView , "user.json"),
          %{ token: token, refresh: refresh }
        ),
      },
      message: "You are successfully logged in! Add this token to authorization header to make authorized requests."
    }
  end


  def render("verify.json", %{}) do
    %{
      status: :ok,
      message: "Your token is not expired!",
    }
  end

  def render("sign_out.json", %{}) do
    %{
      status: :ok,
      message: "You are successfully signed out! Please receive new token to make requests."
    }
  end
end
