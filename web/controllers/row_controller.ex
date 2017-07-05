defmodule Dashboard.RowController do
  use Dashboard.Web, :controller

  alias Dashboard.Row

  def index(conn, _params) do
    rows = Repo.all(Row)
    render(conn, "index.json", rows: rows)
  end

  def create(conn, %{"row" => row_params}) do
    changeset = Row.changeset(%Row{}, row_params)

    case Repo.insert(changeset) do
      {:ok, row} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", row_path(conn, :show, row))
        |> render("show.json", row: row)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Dashboard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    row = Repo.get!(Row, id)
    render(conn, "show.json", row: row)
  end

  def update(conn, %{"id" => id, "row" => row_params}) do
    row = Repo.get!(Row, id)
    changeset = Row.changeset(row, row_params)

    case Repo.update(changeset) do
      {:ok, row} ->
        render(conn, "show.json", row: row)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Dashboard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    row = Repo.get!(Row, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(row)

    send_resp(conn, :no_content, "")
  end
end
