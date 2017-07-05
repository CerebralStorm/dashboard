defmodule Dashboard.RowTest do
  use Dashboard.ModelCase

  alias Dashboard.Row

  @valid_attrs %{table_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Row.changeset(%Row{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Row.changeset(%Row{}, @invalid_attrs)
    refute changeset.valid?
  end
end
