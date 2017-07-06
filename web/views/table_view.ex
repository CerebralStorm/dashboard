defmodule Dashboard.TableView do
  use Dashboard.Web, :view

  def render("index.json", %{tables: tables}) do
    %{data: render_many(tables, Dashboard.TableView, "table.json")}
  end

  def render("show.json", %{table: table}) do
    %{data: render_one(table, Dashboard.TableView, "table.json")}
  end

  def render("table.json", %{table: table}) do
    %{id: table.id,
      name: table.name,
      columns: render_many(table.columns, Dashboard.ColumnView, "column.json"),
      rows: render_many(table.rows, Dashboard.RowView, "row.json")}
  end
end
