defmodule PE.SumSquare do
  @moduledoc """
  Documentation for `SumSquare` module.
  """

  @doc """
  The sum of the squares of the first ten natural numbers is,

  1^2 + 2^2 + ... + 10^2 = 385

  The square of the sum of the first ten natural numbers is,

  (1 + 2 + ... + 10)^2 = 55^2 = 3025

  Hence the difference between the sum of the squares of the first ten
  natural numbers and the square of the sum is 3025 − 385 = 2640.

  Find the difference between the sum of the squares of the first one hundred
  natural numbers and the square of the sum.
  """

  @spec sum_of_squares(Enum) :: number
  def sum_of_squares(numbers) do
    numbers
    |> Enum.reduce(0, &(&2 + :math.pow(&1, 2)))
  end

  @spec square_of_sum(Enum) :: number
  def square_of_sum(numbers) do
    numbers
    |> Enum.reduce(0, &+/2)
    |> :math.pow(2)
  end

  @spec difference(Enum) :: number
  def difference(numbers) do
    sum_of_squares = sum_of_squares(numbers)
    square_of_sum = square_of_sum(numbers)

    square_of_sum - sum_of_squares
  end
end
