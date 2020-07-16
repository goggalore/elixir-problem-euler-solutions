defmodule PE.Palindrome do
  @moduledoc """
  Documentation for `PE.Palindrome` module.
  """

  @doc """
  A palindromic number reads the same both ways. The largest palindrome made
  from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """
  require Integer

  @spec is_palindrome?(non_neg_integer) :: bool
  def is_palindrome?(n) when n < 10, do: true

  def is_palindrome?(n) do
    n == reverse(n, 0)
  end

  defp reverse(n, reversed) do
    if n > 0, do: reverse(div(n, 10), 10 * reversed + rem(n, 10)), else: reversed
  end

  def max_palindrome_of_three_digit_pair_product() do
    three_digit_numbers = 999..100

    three_digit_numbers
    |> Enum.reduce(0, fn n, acc ->
      p = get_max_palindromic_product(n)
      if p > acc, do: p, else: acc
    end)
  end

  defp get_max_palindromic_product(n) do
    three_digit_numbers = 999..100

    three_digit_numbers
    |> Enum.reduce_while(0, fn m, _ ->
      product = n * m
      if is_palindrome?(product), do: {:halt, product}, else: {:cont, 0}
    end)
  end
end
