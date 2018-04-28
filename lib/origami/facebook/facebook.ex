defmodule Origami.Facebook do
  alias Origami.Facebook.Graph

  def fetch_email(access_token) do
    case Graph.get("me", [], params: %{"access_token": access_token, "fields": "email"}) do
      {:ok, %{body: %{"email" => email}}} -> {:ok, email}
      {:ok, %{body: %{"error" => error}}} ->
        {:error, error["message"]}
    end
  end
end
