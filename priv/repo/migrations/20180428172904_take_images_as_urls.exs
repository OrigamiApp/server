defmodule Origami.Repo.Migrations.TakeImagesAsUrls do
  use Ecto.Migration

  def change do
    alter table(:tags) do
      modify :image, :string
      modify :background, :string
    end
  end
end
