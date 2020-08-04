defmodule Math do
  @moduledoc """
  General useful math functions
  """

  @spec multiple?(non_neg_integer, non_neg_integer) :: bool
  def multiple?(divisor, dividend) do
    rem(divisor, dividend) == 0
  end

  # gets the multiples of a number n with a result smaller than bound
  @spec multiples(non_neg_integer, integer) :: [integer]
  def multiples(n, bound) do
    multiples(n, bound, 2, [])
  end

  defp multiples(n, bound, i, accum) do
    result = n * i

    if result >= bound do
      accum
    else
      multiples(n, bound, i + 1, [result | accum])
    end
  end

  @spec prime_factors(non_neg_integer) :: [{non_neg_integer, non_neg_integer}]
  def prime_factors(n) do
    prime_index = 0
    prime_factors(n, Prime.get_prime(prime_index), prime_index, 0, [])
  end

  defp prime_factors(n, current_prime, prime_index, current_pow, prime_factors) do
    new_pf =
      if current_pow != 0,
        do: [{current_prime, current_pow} | prime_factors],
        else: prime_factors

    if n == 1 do
      new_pf
    else
      if rem(n, current_prime) == 0 do
        prime_factors(
          div(n, current_prime),
          current_prime,
          prime_index,
          current_pow + 1,
          prime_factors
        )
      else
        new_prime_index = prime_index + 1

        prime_factors(
          n,
          Prime.get_prime(new_prime_index),
          new_prime_index,
          0,
          new_pf
        )
      end
    end
  end
end
