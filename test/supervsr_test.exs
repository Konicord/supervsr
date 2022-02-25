defmodule SupervsrTest do
  use ExUnit.Case
  doctest Supervsr

  test "greets the world" do
    assert Supervsr.hello() == :world
  end
end
