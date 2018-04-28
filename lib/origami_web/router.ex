defmodule OrigamiWeb.Router do
  use OrigamiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OrigamiWeb do
    pipe_through :api
  end
end
