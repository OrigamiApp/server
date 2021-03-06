defmodule Origami.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :fb_access_token, :string
    has_many :tags, Origami.Tags.Tag

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :fb_access_token])
    |> validate_required([:email, :fb_access_token])
  end
end
