defmodule Dashboard.ColumnView do
  use Dashboard.Web, :view

  def render("index.json", %{columns: columns}) do
    %{data: render_many(columns, Dashboard.ColumnView, "column.json")}
  end

  def render("show.json", %{column: column}) do
    %{data: render_one(column, Dashboard.ColumnView, "column.json")}
  end

  def render("column.json", %{column: column}) do
    %{id: column.id,
      name: column.name,
      position: column.position,
      table_id: column.table_id}
  end
end
