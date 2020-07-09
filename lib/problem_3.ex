defmodule PE.Prime.Factors do
  @moduledoc """
  Documentation for `PE.Prime.Factors`.
  """

  @doc """
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143?

  """
  @spec list(non_neg_integer) :: [non_neg_integer]
  def list(n) do
    initial_primes = if rem(n, 2) == 0, do: [2], else: []
    list(n, 3, initial_primes, :math.sqrt(n))
  end

  defp list(n, factor, last_prime_factors, max_factor) do
    case rem(n, factor) == 0 do
      true when factor < max_factor ->
        if multiple_of_primes?(factor, last_prime_factors) do
          list(n, factor + 2, last_prime_factors, max_factor)
        else
          list(n, factor + 2, [factor | last_prime_factors], max_factor)
        end

      false when factor < max_factor ->
        list(n, factor + 2, last_prime_factors, max_factor)

      _ ->
        find_last_factor(n, factor, last_prime_factors, max_factor)
    end
  end

  defp multiple_of_primes?(n, prime_factors) do
    Enum.any?(prime_factors, &(rem(n, &1) == 0))
  end

  defp find_last_factor(n, factor, prime_factors, max_factor) do
    case rem(n, factor) == 0 do
      true when factor < n ->
        if multiple_of_primes?(factor, prime_factors) do
          find_last_factor(n, factor + 2, prime_factors, max_factor)
        else
          [factor | prime_factors]
        end

      false when factor < n ->
        find_last_factor(n, factor + 2, prime_factors, max_factor)

      _ ->
        prime_factors
    end
  end
end
