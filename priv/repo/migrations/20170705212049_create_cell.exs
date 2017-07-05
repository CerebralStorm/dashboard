defmodule Dashboard.Repo.Migrations.CreateCell do
  use Ecto.Migration

  def change do
    create table(:cells) do
      add :table_id, :integer
      add :row_id, :integer
      add :column_id, :integer
      add :value, :string

      timestamps()
    end

  end
end
