defmodule OrigamiWeb.TagView do
  use OrigamiWeb, :view
  alias OrigamiWeb.TagView

  def render("index.json", %{tags: tags}) do
    %{data: render_many(tags, TagView, "tag.json")}
  end

  def render("show.json", %{tag: tag}) do
    %{data: render_one(tag, TagView, "tag.json")}
  end

  def render("tag.json", %{tag: tag}) do
    %{id: tag.id,
      description: tag.description,
      image: tag.image,
      background: tag.background,
      lat: tag.lat,
      long: tag.long}
  end
end
