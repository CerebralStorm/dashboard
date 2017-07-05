defmodule Dashboard.CellView do
  use Dashboard.Web, :view

  def render("index.json", %{cells: cells}) do
    %{data: render_many(cells, Dashboard.CellView, "cell.json")}
  end

  def render("show.json", %{cell: cell}) do
    %{data: render_one(cell, Dashboard.CellView, "cell.json")}
  end

  def render("cell.json", %{cell: cell}) do
    %{id: cell.id,
      table_id: cell.table_id,
      column_id: cell.column_id,
      value: cell.value}
  end
end
