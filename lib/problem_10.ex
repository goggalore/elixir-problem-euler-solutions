defmodule PE.SumOfPrimes do
  @doc """

  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """

  @spec sum(non_neg_integer) :: non_neg_integer
  def sum(bound) do
    Prime.get_primes_with_bound(bound)
    |> Enum.sum()
  end
end
