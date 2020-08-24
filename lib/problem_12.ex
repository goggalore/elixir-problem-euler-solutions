defmodule TriangleNumbers do
  @moduledoc """
  Documentation for Project Euler problem number 12.
  """

  @doc """
  The sequence of triangle numbers is generated by adding the natural numbers.
  So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.
  The first ten terms would be:

  1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

  Let us list the factors of the first seven triangle numbers:

  1: 1
  3: 1,3
  6: 1,2,3,6
  10: 1,2,5,10
  15: 1,3,5,15
  21: 1,3,7,21
  28: 1,2,4,7,14,28

  We can see that 28 is the first triangle number to have over five divisors.

  What is the value of the first triangle number to have over five hundred divisors?
  """

  @spec get_term(integer) :: integer
  def get_term(n) when n < 1, do: 0
  def get_term(1), do: 1

  def get_term(n) do
    n + get_term(n - 1)
  end

  def highly_divisible_term(min_number_of_divisors) do
    highly_divisible_term(min_number_of_divisors, 1)
  end

  defp highly_divisible_term(min_number_of_divisors, index) do
    triangle_number = get_term(index)

    if min_number_of_divisors <= Math.number_of_divisors(triangle_number) do
      {triangle_number, index}
    else
      highly_divisible_term(min_number_of_divisors, index + 1)
    end
  end
end