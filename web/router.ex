defmodule Forum.Router do
  use Forum.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    plug Forum.Plugs.SetUser
  end


  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Forum do
    pipe_through :browser

    get "/", TopicController, :index

    resources "/", TopicController
  end

  scope "/auth", Forum do
    pipe_through :browser

    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end
end
