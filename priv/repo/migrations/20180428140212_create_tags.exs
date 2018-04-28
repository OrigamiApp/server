defmodule Origami.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :description, :string
      add :image, :uuid
      add :background, :uuid
      add :lat, :integer
      add :long, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tags, [:user_id])
  end
end
