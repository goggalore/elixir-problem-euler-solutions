defmodule PE.RangeDivisible do
  @moduledoc """
  Documentation for `PE.RangeDivisible` module.
  """

  @doc """
  2520 is the smallest number that can be divided by each of the numbers
  from 1 to 10 without any remainder.

  What is the smallest positive number that is evenly divisible by all
  of the numbers from 1 to 20?
  """

  # heavily uses the fundimental theorem of algebra
  @spec find(non_neg_integer) :: integer
  def find(upper_bound) do
    primes = Prime.get_primes_with_bound(upper_bound)
    limit = :math.sqrt(upper_bound)
    find(upper_bound, primes, limit, 1)
  end

  defp find(upper_bound, primes, limit, result) do
    case primes do
      [] ->
        trunc(result)

      [prime | remaining_primes] ->
        if prime < limit do
          prime_power = trunc(:math.log(upper_bound) / :math.log(prime))
          new_result = result * :math.pow(prime, prime_power)
          find(upper_bound, remaining_primes, limit, new_result)
        else
          new_result = result * prime
          find(upper_bound, remaining_primes, limit, new_result)
        end
    end
  end
end
