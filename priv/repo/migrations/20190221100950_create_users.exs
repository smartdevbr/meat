defmodule Meat.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :token, :string
      add :email, :string
      add :provider, :string

      timestamps()
    end

  end
end
