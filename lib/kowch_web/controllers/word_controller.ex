defmodule KowchWeb.WordController do
  use Phoenix.Controller, namespace: KowchWeb

  def show(conn, %{"id" => id}) do
    json(conn, %{word_id: id})
  end
end
