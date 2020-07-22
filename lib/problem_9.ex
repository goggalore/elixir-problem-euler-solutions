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
  def find_triplet(n) when n < 0, do: {:error, "argument must be a positive number"}
  def find_triplet(0), do: {:ok, {0, 0, 0}}

  def find_triplet(n) do
    find_triplet({1, 1, 1}, n)
  end

  defp find_triplet(triplet, n) do
    {a, b, c} = triplet

    if c < n do
      case incr_b(triplet, n) do
        {true, t} -> {:ok, t}
        {false, _} -> find_triplet({a, b, c + 1}, n)
      end
    else
      {:error, "No such triplet exists where a, b, c are all positive integers"}
    end
  end

  defp incr_b(triplet, n) do
    {a, b, c} = triplet

    case incr_a(triplet, n) do
      {true, t} ->
        {true, t}

      {false, _} when b < c ->
        incr_b({a, b + 1, c}, n)

      {false, _} ->
        {false, triplet}
    end
  end

  defp incr_a(triplet, n) do
    if solution?(triplet, n) do
      {true, triplet}
    else
      {a, b, c} = triplet
      if a < c, do: incr_a({a + 1, b, c}, n), else: {false, triplet}
    end
  end

  defp solution?({a, b, c}, n) do
    pythagorean? = :math.pow(a, 2) + :math.pow(b, 2) == :math.pow(c, 2)
    additive? = a + b + c == n
    pythagorean? and additive?
  end
end

"""
3^2 + 4^2 = 5^2 = 25

let a + b + c = 12
where a^2 + b^2 = c^2

(a + b + c)^2 = 12^2
a^2 + 2ab + 2ac + b^2 + 2bc + c^2 = 144
a^2 + 2b(a + c) + 2ac + b^2 + c^2 = 144
a^2 + 2b(a + c) + 2ac + c^2 - a^2 + c^2 = 144
2b(a + c) + 2ac + 2c^2 = 144
2b(a + c) + 2(c - b)c + 2c^2 = 144
2b(a + c) - bc + 4c^2 = 144
2ab + bc + 4c^2 = 144

c^2 + bc + ac = 12c
bc = 12c - ac - c^2

2ab + 12c - ac - c^2 + 4c^2 = 144
2ab - ac + 3c^2 + 12c = 144
a(2b - c) + 3c^2 + 12c = 144

a = 12 - b - c

(12 - b - c)(2b - c) + 3c^2 + 12c = 144
24b - 12c - 2b^2 + bc - 2cb + c^2 + 3c^2 + 12c = 144


can use system elimination now?
24b - 2b^2 - bc + 4c^2 = 144
a + b + c = 12
a^2 + b^2 = c^2

ab + b^2 + bc - 12b = 0

2ab + 2b^2 + 2bc - 24b = 0
24b - 2b^2 + bc + 4c^2 = 144
=
2ab + 3bc + 4c^2 = 144




let a + b + c = n
where a^2 + b^2 = c^2

a(a + 1) + b(b + 1) + c(1 - c) = n

"""
