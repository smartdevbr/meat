defmodule Meat.Repo.Migrations.AssociateUserRestaurant do
  use Ecto.Migration

  def change do
    alter table :restaurants do
      add :user_id, references(:users, on_delete: :delete_all)
    end
  end
end
