defmodule Prime do
  @moduledoc """
  Documentation for `Prime` module.
  """

  @doc """
  Efficiently lists generates primes smaller than 1,000,000
  Don't use on bigger numbers unless you want your computer to explode
  """
  require Integer

  @spec get_primes(non_neg_integer) :: [non_neg_integer]
  def get_primes(bound) do
    sqrt = trunc(:math.sqrt(bound))

    filter_odds = fn b -> Enum.filter(3..b, &Integer.is_odd/1) end

    two_and_odds_to_square = [2 | filter_odds.(sqrt)]
    two_and_odds = [2 | filter_odds.(bound)]

    get_primes(two_and_odds_to_square, two_and_odds)
  end

  @spec get_primes([non_neg_integer], [non_neg_integer]) :: [non_neg_integer]
  defp get_primes(remaining, acc) do
    case remaining do
      [] ->
        acc

      [prime | tail] ->
        new_acc = Enum.filter(acc, &(rem(&1, prime) != 0 or &1 == prime))
        get_primes(tail, new_acc)
    end
  end
end
