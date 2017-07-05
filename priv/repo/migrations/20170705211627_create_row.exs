defmodule Dashboard.Repo.Migrations.CreateRow do
  use Ecto.Migration

  def change do
    create table(:rows) do
      add :table_id, :integer
      add :data, :map

      timestamps()
    end

  end
end
