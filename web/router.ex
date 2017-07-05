defmodule Dashboard.Router do
  use Dashboard.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    #plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Dashboard do
    pipe_through :browser # Use the default browser stack

    get "/", TableController, :index
    resources "/tables", TableController
    resources "/columns", ColumnController
    resources "/rows", RowController, except: [:new, :edit]
    resources "/cells", CellController, except: [:new, :edit]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Dashboard do
  #   pipe_through :api
  # end
end
