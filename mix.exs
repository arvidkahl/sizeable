defmodule Sizeable.Mixfile do
  use Mix.Project

  def project do
    [app: :sizeable,
     version: "0.1.0",
     elixir: "~> 1.3",
     description: "An Elixir library to make File Sizes human-readable",
     package: package(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application

  def application do
    [applications: [:logger]]
  end

  defp package do
    [
      maintainers: ["Arvid Kahl"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/arvidkahl/sizeable"},
      files: ["lib", "test", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],      
    ]
  end

  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end
end
