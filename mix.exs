defmodule AlchemyGb.MixProject do
  use Mix.Project

  def project do
    [
      app: :alchemy_gb,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preffered_cli_env: [espec: :test]
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
      {:mix_test_watch, "~> 0.6", only: :test, runtime: false},
      {:espec, "~> 1.5.0", only: :test}
    ]
  end
end
