defmodule TriangleNumbers do
  @spec get_term(integer) :: integer
  def get_term(n) when n < 1, do: 0
  def get_term(1), do: 1

  def get_term(n) do
    n + get_term(n - 1)
  end
end
