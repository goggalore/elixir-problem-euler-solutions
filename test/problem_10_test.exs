defmodule PE.SumOfPrimesTest do
  use ExUnit.Case, async: true

  test "The sum of primes below 10 is 17" do
    assert PE.SumOfPrimes.sum(10) == 17
  end
end
