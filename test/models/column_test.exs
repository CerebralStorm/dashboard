defmodule Dashboard.ColumnTest do
  use Dashboard.ModelCase

  alias Dashboard.Column

  @valid_attrs %{name: "some content", position: 42, table_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Column.changeset(%Column{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Column.changeset(%Column{}, @invalid_attrs)
    refute changeset.valid?
  end
end
