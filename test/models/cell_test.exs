defmodule Dashboard.CellTest do
  use Dashboard.ModelCase

  alias Dashboard.Cell

  @valid_attrs %{column_id: 42, table_id: 42, value: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Cell.changeset(%Cell{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Cell.changeset(%Cell{}, @invalid_attrs)
    refute changeset.valid?
  end
end
