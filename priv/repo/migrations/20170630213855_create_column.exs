defmodule Dashboard.Repo.Migrations.CreateColumn do
  use Ecto.Migration

  def change do
    create table(:columns) do
      add :name, :string
      add :position, :integer
      add :table_id, :integer

      timestamps()
    end

  end
end
