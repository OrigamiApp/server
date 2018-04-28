defmodule Origami.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :fb_access_token, :string
    end
  end
end
