defmodule Dashboard.Repo.Migrations.CreateRow do
  use Ecto.Migration

  def change do
    create table(:rows) do
      add :table_id, :integer

      timestamps()
    end

  end
end
