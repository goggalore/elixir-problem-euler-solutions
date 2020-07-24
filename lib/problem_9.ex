defmodule PE.SpecialPythagoreanTriplet do
  @moduledoc """
  Documentation for 'PE.SpecialPythagoreanTriplet' module
  """

  @doc """
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

  a^2 + b^2 = c^2
  For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.
  """

  def product(n) do
    case find_triplet(n) do
      {:ok, {a, b, c}} -> a * b * c
      {:error, msg} -> raise msg
    end
  end

  @spec find_triplet(any) ::
          {:error, String.t()} | {:ok, {pos_integer, pos_integer, pos_integer}}

  def find_triplet(n) when n < 0 or not is_integer(n),
    do: {:error, "argument must be a positive number"}

  def find_triplet(0), do: {:ok, {0, 0, 0}}

  def find_triplet(n) do
    no_sol = {:error, "No such triplet exists where a, b, c are all positive integers"}
    a_n = 3..div(n - 3, 3)

    a_n
    |> Enum.reduce_while(no_sol, fn a, _ ->
      b_n = (a + 1)..div(n - 1 - a, 2)

      {status, triplet} =
        b_n
        |> Enum.reduce_while(no_sol, fn b, _ ->
          c = n - a - b

          if solution?({a, b, c}, n) do
            {:halt, {:ok, {a, b, c}}}
          else
            {:cont, no_sol}
          end
        end)

      case status do
        :ok -> {:halt, {:ok, triplet}}
        :error -> {:cont, no_sol}
      end
    end)
  end

  defp solution?({a, b, c}, n) do
    pythagorean? = a * a + b * b == c * c
    additive? = a + b + c == n
    pythagorean? and additive?
  end
end
