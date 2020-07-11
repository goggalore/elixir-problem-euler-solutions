defmodule PE.PrimeFactorsTest do
  use ExUnit.Case, async: true

  test "get the maximum prime factor of a prime, which is the prime" do
    assert PE.Prime.Factors.max(941) == 941
  end

  test "get the maximum prime factor of 600851475143" do
    assert PE.Prime.Factors.max(600_851_475_143) == 6857
  end
end
