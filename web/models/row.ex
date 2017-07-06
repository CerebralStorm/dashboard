defmodule Dashboard.Row do
  use Dashboard.Web, :model

  schema "rows" do
    belongs_to :table, Dashboard.Table
    field :data, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:table_id, :data])
    |> validate_required([:table_id, :data])
  end
end
