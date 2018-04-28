defmodule OrigamiWeb.UserView do
  use OrigamiWeb, :view
  alias OrigamiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    tags = Enum.map(user.tags, &(&1.id))
    %{id: user.id,
      email: user.email,
      fb_access_token: user.fb_access_token,
      tags: tags}
  end
end
