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
  end

  # Other scopes may use custom stacks.
  scope "/api", Dashboard do
    pipe_through :api

    resources "/tables", TableController, except: [:new, :edit]
    resources "/rows", RowController, except: [:new, :edit]
  end
end
