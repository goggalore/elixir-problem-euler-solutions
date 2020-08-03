defmodule Prime do
  @moduledoc """
  Documentation for `Prime` module.
  """

  @doc """
  Efficiently lists generates primes smaller than 1,000,000
  Don't use on bigger numbers unless you want your computer to explode
  """
  require Integer

  def is_prime?(n) do
    n in get_primes_with_bound(n)
  end

  def get_prime(index) do
    get_primes(index)
    |> Enum.fetch!(0)
  end

  # note that this is the Sieve of Eratosthenes algorithm
  @spec get_primes(integer) :: [non_neg_integer]
  def get_primes(index) when index < 0 do
    []
  end

  def get_primes(0), do: [2]
  def get_primes(1), do: [3, 2]

  def get_primes(index) do
    primes = get_primes(1)
    get_primes(index, 5, primes)
  end

  defp get_primes(index, current, prev_primes) do
    is_multiple =
      prev_primes
      |> Enum.any?(&Math.multiple?(current, &1))

    case is_multiple do
      true when length(prev_primes) <= index ->
        get_primes(index, current + 2, prev_primes)

      false when length(prev_primes) <= index ->
        get_primes(index, current + 2, [current | prev_primes])

      _ ->
        prev_primes
    end
  end

  # note that this is the Sieve of Eratosthenes algorithm
  @spec get_primes_with_bound(non_neg_integer) :: [non_neg_integer]
  def get_primes_with_bound(n) when n < 2, do: []

  def get_primes_with_bound(bound) do
    sqrt = trunc(:math.sqrt(bound))

    filter_odds = fn b -> Enum.filter(3..b, &Integer.is_odd/1) end

    two_and_odds_to_square = [2 | filter_odds.(sqrt)]
    two_and_odds = [2 | filter_odds.(bound)]

    eliminate_multiples(two_and_odds_to_square, two_and_odds)
  end

  @spec eliminate_multiples([non_neg_integer], [non_neg_integer]) :: [non_neg_integer]
  defp eliminate_multiples(remaining, acc) do
    case remaining do
      [] ->
        acc

      [prime | tail] ->
        new_acc = Enum.filter(acc, &(rem(&1, prime) != 0 or &1 == prime))
        eliminate_multiples(tail, new_acc)
    end
  end
end
