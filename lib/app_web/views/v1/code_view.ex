defmodule AppWeb.V1.CodeView do
  use AppWeb, :view
  alias AppWeb.V1.CodeView

  def render("index.json", %{codes: codes}) do
    %{data: render_many(codes, CodeView, "code.json")}
  end

  def render("show.json", %{code: code}) do
    %{data: render_one(code, CodeView, "code.json")}
  end

  def render("code.json", %{code: code}) do
    %{
      id: code.id,
      best_by: code.best_by,
      serial: code.serial,
      type: code.type
    }
  end
end
