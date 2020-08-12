defmodule TestappTest do
  use ExUnit.Case
  doctest Testapp

  test "greets the world" do
    assert Testapp.hello() == :world
  end
end
