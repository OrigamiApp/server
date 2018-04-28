defmodule Origami.Tags.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :background, :string
    field :description, :string
    field :image, :string
    field :lat, :float
    field :long, :float
    belongs_to :user, Origami.Auth.User

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:description, :image, :background, :lat, :long, :user_id])
    |> validate_required([:description, :image, :background, :lat, :long, :user_id])
  end
end
