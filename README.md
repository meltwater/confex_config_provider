# ConfexConfigProvider

A [runtime configuration
provider](https://hexdocs.pm/distillery/extensibility/config_providers.html)
that uses [Confex](https://github.com/Nebo15/confex) and works with
Distillery 2.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `confex_config_provider` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:confex_config_provider, "~> 0.1.0"}
  ]
end
```

## Usage

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

Documentation is available at
[https://hexdocs.pm/confex_config_provider](https://hexdocs.pm/confex_config_provider).

