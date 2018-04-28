defmodule Origami.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :fb_access_token, :string
      timestamps()
    end
  end
end
