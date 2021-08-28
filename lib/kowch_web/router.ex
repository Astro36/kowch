defmodule KowchWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", KowchWeb do
    pipe_through :api
    get "/words/:id", WordController, :show
  end
end
