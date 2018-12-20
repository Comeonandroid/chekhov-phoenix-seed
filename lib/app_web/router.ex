defmodule AppWeb.Router do
  use AppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", AppWeb.V1 do
    pipe_through :api
  end
end
