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
      table_id: column.table_id,
      name: column.name,
      table_key: column.table_key,
      position: column.position}
  end
end
