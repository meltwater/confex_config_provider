defmodule ConfexConfigProviderTest do
  use ExUnit.Case
  doctest ConfexConfigProvider

  test "greets the world" do
    assert ConfexConfigProvider.hello() == :world
  end
end
