defmodule AppWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use AppWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(AppWeb.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:forbidden)
    |> render(AppWeb.ErrorView, :"403")
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(AppWeb.ErrorView, :"404")
  end

  def call(conn, {:error, :login_failed}), do: login_failed(conn)
  def call(conn, {:error, :login_not_found}), do: login_failed(conn)

  # API Fallback
  def call(conn, {:error, :parcing_api_failed}) do
    conn
    |> put_status(:bad_request)
    |> render(AppWeb.ErrorView, "error.json", status: :bad_request,  message: "Parsing API Failed")
  end

  def call(conn, {:error, :parcing_api_failed, message}) do
    conn
    |> put_status(:bad_request)
    |> render(AppWeb.ErrorView, "error.json", status: :bad_request,  message: message)
  end

  defp login_failed(conn) do
    conn
    |> put_status(:unauthorized)
    |> render(AppWeb.ErrorView, "error.json", status: :unauthorized,  message: "Неверный email или пароль")
  end

end
