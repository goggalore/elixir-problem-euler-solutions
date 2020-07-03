defmodule PE.Prime.Factors do
  @moduledoc """
  Documentation for `PE.Prime.Factors`.
  """

  @doc """
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143?

  """

  @spec list(non_neg_integer) :: [non_neg_integer]
  def list(dividend) do
    PE.Divisors.list(dividend)
    |> Enum.filter(&Prime.is_prime?/1)
  end

  @spec max(non_neg_integer) :: non_neg_integer
  def max(dividend) do
    list(dividend)
    |> Enum.max()
  end
end

defmodule PE.Divisors do
  @moduledoc """
  Documentation for `Pe.Divisors`
  """

  ## Finds all divisors of a given number that are not 1 or the dividend itself
  @spec list(non_neg_integer) :: [non_neg_integer]
  def list(dividend) do
    square_bound = trunc(:math.sqrt(dividend))

    get_divisor_and_result = fn divisor ->
      case rem(dividend, divisor) do
        0 ->
          result = div(dividend, divisor)

          case result do
            1 -> []
            ^dividend -> []
            ^divisor -> [result]
            _ -> [divisor, result]
          end

        _ ->
          []
      end
    end

    2..square_bound
    |> Enum.map(get_divisor_and_result)
    |> List.flatten()
  end
end
