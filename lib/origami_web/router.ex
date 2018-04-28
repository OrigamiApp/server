defmodule OrigamiWeb.Router do
  use OrigamiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OrigamiWeb do
    pipe_through :api

    get "/login", UserController, :login
    resources "/users", UserController, except: [:new, :edit]
  end
end
