defmodule SortedSet.MixProject do
  use Mix.Project
  @version "1.2.1"
  @source_url "https://github.com/boyzwj/sorted_set_nif"

  def project do
    [
      app: :sorted_set_nif,
      name: "SortedSet",
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      compilers: Mix.compilers(),
      deps: deps(),
      docs: docs(),
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:rustler_precompiled, "~> 0.6.1"},
      {:rustler, ">= 0.0.0", optional: true},
      {:jemalloc_info, "~> 0.3.0", app: false},
      {:ex_doc, "~> 0.19", only: [:dev], runtime: false},
      {:benchee, "~> 1.1", only: [:dev]},
      {:benchee_html, "~> 1.0", only: [:dev]},
      {:stream_data, "~> 0.5.0", only: [:test]},
      {:dialyxir, "~> 1.0.0", only: [:dev], runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      name: "SortedSet",
      extras: ["README.md"],
    ]
  end

  defp elixirc_paths(:test) do
    elixirc_paths(:default) ++ ["test/support"]
  end

  defp elixirc_paths(_) do
    ["lib"]
  end

  defp package do
    [
      maintainers: ["Discord Core Infrastructure"],
      licenses: ["MIT"],
      name: :sorted_set_nif,
      description: "SortedSet is a fast and efficient Rust backed sorted set.",
      files: ["lib",
              "native",
              "checksum-*.exs",
              "priv/.gitkeep",
              "mix.exs",
              ".formatter.exs",
              "README*",
              "LICENSE*"
              ],
      links: %{"GitHub" => @source_url}
    ]
  end
end
