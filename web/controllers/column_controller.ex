defmodule Dashboard.ColumnController do
  use Dashboard.Web, :controller

  alias Dashboard.Column

  def index(conn, _params) do
    columns = Repo.all(Column)
    render(conn, "index.json", columns: columns)
  end

  def create(conn, %{"column" => column_params}) do
    changeset = Column.changeset(%Column{}, column_params)

    case Repo.insert(changeset) do
      {:ok, column} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", column_path(conn, :show, column))
        |> render("show.json", column: column)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Dashboard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    column = Repo.get!(Column, id)
    render(conn, "show.json", column: column)
  end

  def update(conn, %{"id" => id, "column" => column_params}) do
    column = Repo.get!(Column, id)
    changeset = Column.changeset(column, column_params)

    case Repo.update(changeset) do
      {:ok, column} ->
        render(conn, "show.json", column: column)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Dashboard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    column = Repo.get!(Column, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(column)

    send_resp(conn, :no_content, "")
  end
end
