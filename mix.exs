defmodule Sizeable.Mixfile do
  use Mix.Project

  @source_url "https://github.com/arvidkahl/sizeable"

  def project do
    [
      app: :sizeable,
      version: "1.0.2",
      elixir: "~> 1.7",
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs()
    ]
  end

  def application do
    [
      applications: [:logger]
    ]
  end

  defp package do
    [
      description: "An Elixir library to make file sizes human-readable.",
      maintainers: ["Arvid Kahl"],
      licenses: ["MIT"],
      files: ["lib", "test", "mix.exs", "README*", "LICENSE*"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:inch_ex, only: :docs}
    ]
  end

  defp docs do
    [
      main: "Sizeable",
      source_url: @source_url,
      api_reference: false,
      formatters: ["html"]
    ]
  end
end
