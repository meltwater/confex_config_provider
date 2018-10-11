defmodule ConfexConfigProviderTest do
  use ExUnit.Case
  doctest ConfexConfigProvider

  test "knows that tests don't run in a release" do
    refute ConfexConfigProvider.release_mode?()
  end
end
