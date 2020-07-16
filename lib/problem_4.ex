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
    digits = Integer.digits(n)
    {first_half, second_half} = digits |> Enum.split(div(length(digits), 2))

    if Integer.is_even(length(digits)) do
      first_half == Enum.reverse(second_half)
    else
      middle_removed = List.delete_at(second_half, 0)
      first_half == Enum.reverse(middle_removed)
    end
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
