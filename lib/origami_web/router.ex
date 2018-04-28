defmodule OrigamiWeb.Router do
  use OrigamiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OrigamiWeb do
    pipe_through :api

    resources "/users", OrigamiWeb.UserController, except: [:new, :edit]
  end
end
