defmodule PE.SumSquares do
  use ExUnit.Case, async: true

  test "The sum of squares of the first ten natural numbers is 385" do
    assert PE.SumSquare.sum_of_squares(1..10) == 385
  end

  test "The square of the sum of the first ten natural numbers is 3025" do
    assert PE.SumSquare.square_of_sum(1..10) == 3025
  end

  test "The difference between the sum of the squares of the first ten
  natural numbers and the square of the sum is 2460" do
    assert PE.SumSquare.difference(1..10) == 2640
  end
end
