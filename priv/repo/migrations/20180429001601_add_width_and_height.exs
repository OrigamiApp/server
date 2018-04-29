defmodule Origami.Repo.Migrations.AddWidthAndHeight do
  use Ecto.Migration

  def change do
    alter table(:tags) do
      add :width, :float
      add :height, :float
    end
  end
end
