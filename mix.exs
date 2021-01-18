defmodule RssExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :rss_example,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {RssExample.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:crawly, "~> 0.12.0"},
      {:sweet_xml, "~> 0.6.6"}
    ]
  end
end
