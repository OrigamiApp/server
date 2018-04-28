defmodule Origami.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :description, :string
      add :image, :binary_id
      add :background, :binary_id
      add :lat, :integer
      add :long, :integer
      timestamps()
    end
  end
end
