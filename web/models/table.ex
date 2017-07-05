defmodule Dashboard.Table do
  use Dashboard.Web, :model

  schema "tables" do
    field :name, :string
    has_many :columns, Dashboard.Column

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end

end
