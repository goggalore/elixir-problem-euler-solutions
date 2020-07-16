defmodule PE.MultiplesTest do
  use ExUnit.Case, async: true

  test "list multiples of 3 and 5 under 10" do
    multiples = PE.Multiples.list([3, 5, 6], 10)
    assert Enum.sort(multiples) == Enum.sort([3, 5, 6, 9])
  end

  test "sum multiples of 3 and 5 under 10" do
    assert PE.Multiples.sum([3, 5, 6], 10) == 23
  end

  # Find the sum of all the multiples of 3 or 5 below 1000
  test "sum of multiples of 3 or 5 below 100" do
    assert PE.Multiples.sum([3, 5], 1000) == 233_168
  end
end
