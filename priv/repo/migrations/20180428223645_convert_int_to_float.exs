defmodule Origami.Repo.Migrations.ConvertIntToFloat do
  use Ecto.Migration

  def change do
    alter table(:tags) do
      modify :lat, :float
      modify :long, :float
    end
  end
end
