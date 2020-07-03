defmodule PE.Multiples do
  @moduledoc """
  Documentation for `PE.Multiples`.
  """

  @doc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.


  ## Examples

      iex> PE.multiples.list([3, 5], 10)
      [3, 5, 6, 9]

      iex> PE.Multiples.sum([3, 5], 10)
      23

  """
  @spec list([integer], integer) :: [integer]
  def list(multiples, bound) do
    list(MapSet.new(), multiples, bound)
  end

  defp list(accum, multiples, bound) do
    case multiples do
      [] ->
        MapSet.to_list(accum)

      [head | tail] ->
        1..(bound - 1)
        |> Enum.filter(&(rem(&1, head) === 0))
        |> MapSet.new()
        |> MapSet.union(accum)
        |> list(tail, bound)
    end
  end

  @spec sum([integer], integer) :: number
  def sum(multiples, bound) do
    list(multiples, bound)
    |> Enum.sum()
  end
end
