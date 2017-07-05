defmodule Dashboard.RowView do
  use Dashboard.Web, :view

  def render("index.json", %{rows: rows}) do
    %{data: render_many(rows, Dashboard.RowView, "row.json")}
  end

  def render("show.json", %{row: row}) do
    %{data: render_one(row, Dashboard.RowView, "row.json")}
  end

  def render("row.json", %{row: row}) do
    %{id: row.id,
      table_id: row.table_id,
      data: row.data}
  end
end
