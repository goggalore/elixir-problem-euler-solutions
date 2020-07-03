defmodule Factorial do
  @doc """
  Provides the function `of/1` which gives the factorial of the arg
  """

  @spec of(non_neg_integer) :: non_neg_integer
  def of(0), do: 1
  def of(n), do: n * of(n - 1)
end
