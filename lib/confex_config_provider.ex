defmodule ConfexConfigProvider do
  @moduledoc """
  ConfexConfigProvider ties together Distillery releases and Confex.

  Put this in in the `release :myapp` section of `rel/config.exs`:

  ```elixir
    set(config_providers: [ConfexConfigProvider])
  ```

  Then, make sure that if the app is not in a release, Confex tuples are still
  resolved. E.g. you could put this at the top of you `application.ex`'s
  `start/2` function:

  ```elixir
    unless ConfexConfigProvider.release_mode?() do
      ConfexConfigProvider.configure_applications()
    end
  ```
  """

  use Mix.Releases.Config.Provider

  @doc """
  Init hook used by Distillery.
  """
  @impl Mix.Releases.Config.Provider
  def init(_conf) do
    configure_applications()
  end

  @doc """
  Configure all applications.

  If given a list, will only configure applications on the list. If given
  `nil` (default), will configure all loaded applications.
  """
  def configure_applications(apps \\ nil)

  def configure_applications(nil) do
    Application.loaded_applications()
    |> Enum.map(&elem(&1, 0))
    |> configure_applications()
  end

  def configure_applications(apps) do
    apps |> Enum.map(&Confex.resolve_env!/1)
  end

  @doc """
  Check if this app is running in release mode.
  """
  def release_mode? do
    !function_exported?(Mix, :env, 0)
  end
end
