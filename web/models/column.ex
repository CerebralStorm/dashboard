defmodule Dashboard.Column do
  use Dashboard.Web, :model

  schema "columns" do
    belongs_to :table, Dashboard.Table
    field :name, :string
    field :table_key, :string
    field :position, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:table_id, :name, :table_key, :position])
    |> validate_required([:table_id, :name, :table_key, :position])
  end
end
