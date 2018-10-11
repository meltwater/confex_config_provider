defmodule ConfexConfigProvider.MixProject do
  use Mix.Project

  def project do
    [
      app: :confex_config_provider,
      description: description(),
      package: package(),
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      docs: [main: "readme", extras: ["README.md"]],
      deps: deps(),
      source_url: "https://github.com/meltwater/confex_config_provider",
      homepage_url: "https://github.com/meltwater/confex_config_provider"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
      {:distillery, "~> 2.0"},
      {:confex, "~> 3.3"}
    ]
  end

  defp description do
    "ConfexConfigProvider ties together Distillery releases and Confex."
  end

  defp package do
    [
      name: "confex_config_provider",
      contributors: ["Meltwater"],
      maintainers: ["Meltwater"],
      licenses: ["LISENSE"],
      links: %{github: "https://github.com/meltwater/confex_config_provider"}
    ]
  end
end
