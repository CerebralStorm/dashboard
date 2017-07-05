defmodule Dashboard.CellControllerTest do
  use Dashboard.ConnCase

  alias Dashboard.Cell
  @valid_attrs %{column_id: 42, table_id: 42, value: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, cell_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    cell = Repo.insert! %Cell{}
    conn = get conn, cell_path(conn, :show, cell)
    assert json_response(conn, 200)["data"] == %{"id" => cell.id,
      "table_id" => cell.table_id,
      "column_id" => cell.column_id,
      "value" => cell.value}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, cell_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, cell_path(conn, :create), cell: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Cell, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, cell_path(conn, :create), cell: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    cell = Repo.insert! %Cell{}
    conn = put conn, cell_path(conn, :update, cell), cell: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Cell, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    cell = Repo.insert! %Cell{}
    conn = put conn, cell_path(conn, :update, cell), cell: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    cell = Repo.insert! %Cell{}
    conn = delete conn, cell_path(conn, :delete, cell)
    assert response(conn, 204)
    refute Repo.get(Cell, cell.id)
  end
end
