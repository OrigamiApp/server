defmodule Origami.Tags.Tag do
  use Ecto.Schema

  schema "tags" do
    field :description, :string
    field :image, :binary_id
    field :background, :binary_id
    field :lat, :integer
    field :long, :integer
    belongs_to :user, Origami.Auth.User
  end
end
