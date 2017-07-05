defmodule Dashboard.Column do
  use Dashboard.Web, :model

  schema "columns" do
    field :name, :string
    field :position, :integer
    belongs_to :table, Dashboard.Table

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :position, :table_id])
    |> validate_required([:name, :position, :table_id])
  end
end
