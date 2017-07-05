defmodule Dashboard.Table do
  use Dashboard.Web, :model

  schema "tables" do
    field :name, :string
    has_many :rows, Dashboard.Row

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
