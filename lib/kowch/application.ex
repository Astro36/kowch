defmodule Kowch.Application do
  use Application

  def config_change(changed, _new, removed) do
    KowchWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  def start(_type, _args) do
    children = [KowchWeb.Endpoint]
    opts = [strategy: :one_for_one, name: Kowch.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
