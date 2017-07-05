defmodule Dashboard.RowControllerTest do
  use Dashboard.ConnCase

  alias Dashboard.Row
  @valid_attrs %{table_id: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, row_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    row = Repo.insert! %Row{}
    conn = get conn, row_path(conn, :show, row)
    assert json_response(conn, 200)["data"] == %{"id" => row.id,
      "table_id" => row.table_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, row_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, row_path(conn, :create), row: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Row, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, row_path(conn, :create), row: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    row = Repo.insert! %Row{}
    conn = put conn, row_path(conn, :update, row), row: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Row, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    row = Repo.insert! %Row{}
    conn = put conn, row_path(conn, :update, row), row: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    row = Repo.insert! %Row{}
    conn = delete conn, row_path(conn, :delete, row)
    assert response(conn, 204)
    refute Repo.get(Row, row.id)
  end
end
