defmodule Kowch.MixProject do
  use Mix.Project

  def project do
    [
      app: :kowch,
      version: "0.1.0",
      elixir: "~> 1.12",
      compilers: Mix.compilers() ++ [:phoenix],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Kowch.Application, []}
    ]
  end

  defp deps do
    [
      {:jason, "~> 1.2"},
      {:phoenix, "~> 1.5"},
      {:plug_cowboy, "~> 2.5"}
    ]
  end
end
