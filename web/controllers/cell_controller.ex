defmodule Dashboard.CellController do
  use Dashboard.Web, :controller

  alias Dashboard.Cell

  def index(conn, _params) do
    cells = Repo.all(Cell)
    render(conn, "index.json", cells: cells)
  end

  def create(conn, %{"cell" => cell_params}) do
    changeset = Cell.changeset(%Cell{}, cell_params)

    case Repo.insert(changeset) do
      {:ok, cell} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", cell_path(conn, :show, cell))
        |> render("show.json", cell: cell)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Dashboard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cell = Repo.get!(Cell, id)
    render(conn, "show.json", cell: cell)
  end

  def update(conn, %{"id" => id, "cell" => cell_params}) do
    cell = Repo.get!(Cell, id)
    changeset = Cell.changeset(cell, cell_params)

    case Repo.update(changeset) do
      {:ok, cell} ->
        render(conn, "show.json", cell: cell)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Dashboard.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cell = Repo.get!(Cell, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(cell)

    send_resp(conn, :no_content, "")
  end
end
