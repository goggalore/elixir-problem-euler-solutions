defmodule Math do
  @moduledoc """
  General useful math functions
  """

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
end
