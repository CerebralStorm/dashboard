defmodule Dashboard.Cell do
  use Dashboard.Web, :model

  schema "cells" do
    field :table_id, :integer
    field :column_id, :integer
    field :value, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:table_id, :column_id, :value])
    |> validate_required([:table_id, :column_id, :value])
  end
end
