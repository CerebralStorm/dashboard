defmodule Dashboard.ColumnControllerTest do
  use Dashboard.ConnCase

  alias Dashboard.Column
  @valid_attrs %{name: "some content", position: 42, table_id: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, column_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    column = Repo.insert! %Column{}
    conn = get conn, column_path(conn, :show, column)
    assert json_response(conn, 200)["data"] == %{"id" => column.id,
      "name" => column.name,
      "position" => column.position,
      "table_id" => column.table_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, column_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, column_path(conn, :create), column: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Column, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, column_path(conn, :create), column: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    column = Repo.insert! %Column{}
    conn = put conn, column_path(conn, :update, column), column: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Column, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    column = Repo.insert! %Column{}
    conn = put conn, column_path(conn, :update, column), column: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    column = Repo.insert! %Column{}
    conn = delete conn, column_path(conn, :delete, column)
    assert response(conn, 204)
    refute Repo.get(Column, column.id)
  end
end
