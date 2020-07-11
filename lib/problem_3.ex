defmodule PE.Prime.Factors do
  @moduledoc """
  Documentation for `PE.Prime.Factors`.
  """

  @doc """
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143?

  """
  @spec max(non_neg_integer) :: non_neg_integer
  def max(n) do
    bound = :math.sqrt(n)
    max(n, 2, bound)
  end

  defp max(n, current_factor, bound) do
    i = if current_factor == 2, do: 1, else: 2

    case rem(n, current_factor) == 0 do
      true when current_factor < bound ->
        new_n = divide_out(n, current_factor)
        new_bound = :math.sqrt(new_n)
        max(new_n, current_factor + i, new_bound)

      false when current_factor < bound ->
        max(n, current_factor + i, bound)

      true ->
        current_factor

      false ->
        n
    end
  end

  defp divide_out(dividend, divisor) do
    case rem(dividend, divisor) == 0 do
      true ->
        div(dividend, divisor)
        |> divide_out(divisor)

      false ->
        dividend
    end
  end
end
