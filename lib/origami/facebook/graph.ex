defmodule Origami.Facebook.Graph do
  use HTTPoison.Base
  @base_url "https://graph.facebook.com/v2.11/"

  def process_url(endpoint) do
    @base_url <> endpoint
  end

  def process_request_headers(headers) do
    [
      Accept: "application/json",
      "Content-Type": "application/json",
    ]
    |> Keyword.merge(headers)
  end

  def process_request_body(body) do
    Poison.encode!(%{data: body})
  end

  def process_response_body(body) do
    map = Poison.decode!(body)
    map["data"] || map
  end
end
