defmodule PE.PrimeTest do
  use ExUnit.Case, async: true

  test "get the sixth prime" do
    # zero indexed
    assert PE.Prime.get(5) == 13
  end

  test "get the 10,001st prime" do
    # zero indexed
    assert PE.Prime.get(10_000) == 104_743
  end
end
