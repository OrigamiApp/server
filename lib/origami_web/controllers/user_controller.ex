defmodule OrigamiWeb.UserController do
  use OrigamiWeb, :controller

  alias Origami.Auth

  action_fallback OrigamiWeb.FallbackController

  def login(conn, %{"access_token" => access_token}) do
    case Auth.authenticate_user(access_token) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_status(:ok)
        |> render("show.json", user: user)

      {:error, message} ->
        conn
        |> delete_session(:current_user_id)
        |> put_status(:unauthorized)
        |> render(OrigamiWeb.ErrorView, "401.json", message: message)
    end
  end
end
