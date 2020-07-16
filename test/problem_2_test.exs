defmodule PE.FibonacciTest do
  use ExUnit.Case, async: true

  test "get fibonacci term 5 (indexed at F0)" do
    assert PE.Fibonacci.get_term(5) == 5
  end

  test "get fibonacci sequence ending at term 5" do
    sequence = PE.Fibonacci.sequence(5)
    assert Enum.sort(sequence) == Enum.sort([0, 1, 1, 2, 3, 5])
  end

  test "list fibonacci numbers whose values that do not exceed 25" do
    sequence = PE.Fibonacci.sequence_with_bound(25)
    assert Enum.sort(sequence) == Enum.sort([0, 1, 1, 2, 3, 5, 8, 13, 21])
  end

  test "sum fibonacci numbers whose values do not exceed 25" do
    assert PE.Fibonacci.sum_sequence_with_bound(25) == 54
  end

  test "get even fibonacci term 4 (indexed at E0)" do
    assert PE.Fibonacci.Even.get_term(4) == 144
  end

  test "get fibonacci sequence ending at term 4" do
    sequence = PE.Fibonacci.Even.sequence(4)
    assert Enum.sort(sequence) == Enum.sort([0, 2, 8, 34, 144])
  end

  # By considering the terms in the Fibonacci sequence whose values do not
  # exceed four million, find the sum of the even-valued terms.
  # test "sum fibonacci numbers whose values do not exceed four million" do
  #   assert PE.Fibonacci.sum_even_sequence_with_bound(4_000_000)
  # end
end
