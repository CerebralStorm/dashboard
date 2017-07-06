defmodule Dashboard.Repo.Migrations.CreateColumn do
  use Ecto.Migration

  def change do
    create table(:columns) do
      add :table_id, :integer
      add :name, :string
      add :table_key, :string
      add :position, :integer

      timestamps()
    end

  end
end
