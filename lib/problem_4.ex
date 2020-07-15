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

  @spec palindrome?(non_neg_integer) :: bool
  def palindrome?(n) when n < 10, do: true

  def palindrome?(n) do
    digits = Integer.digits(n)

    if Integer.is_even(length(digits)) do
      even_palindrome?(digits)
    else
      odd_palindrome?(digits)
    end
  end

  defp even_palindrome?(digits) do
    half_length = div(length(digits), 2)
    {first, second} = Enum.split(digits, half_length)

    length(first -- second) == 0
  end

  defp odd_palindrome?(digits) do
  end
end
