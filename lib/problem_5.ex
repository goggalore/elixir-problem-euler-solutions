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

  @spec find(Range) :: integer
  def find(range) do
    initial = Enum.fetch!(range, length(range |> Enum.to_list()) - 1) * 2
    find(range, initial)
  end

  defp find(range, n) do
    divisible_by_all? =
      range
      |> Enum.all?(&Math.multiple?(n, &1))

    case divisible_by_all? do
      true -> n
      false -> find(range, n + 1)
    end
  end
end
