defmodule AppWeb.V1.Auth.AuthView do
  use AppWeb, :view

  def render("sign_up.json", %{user: user, token: token, refresh: refresh}) do
    %{
      status: :ok,
      data: %{
        user: %{
          id: user.id,
          email: user.email,
          token: token,
          refresh: refresh,
        },
      },
      message: "Вы успешно зарегестрировались!"
    }
  end
end
