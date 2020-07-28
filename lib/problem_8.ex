defmodule PE.SeriesProduct do
  @doc """

  The four adjacent digits in the 1000-digit
  number that have the greatest product are 9 × 9 × 8 × 9 = 5832.

  [the 1000 digit number can be seen in problem_8_test.exs]


  ## Examples

    iex> PE.SeriesProduct.largest_product(large_number, 4)
    5832

    iex> PE.SeriesProduct.largest_product(large_number, 13)
    23514624000

  """

  require Integer

  @spec largest_product(non_neg_integer, non_neg_integer) :: non_neg_integer
  def largest_product(number, size) do
    sequence = Integer.digits(number)

    sub_sequences = all_sub_sequences(sequence, size, [])

    sub_sequences
    |> Enum.map(fn sub_sequence -> Enum.reduce(sub_sequence, &*/2) end)
    |> Enum.max()
  end

  defp all_sub_sequences(sequence, size, acc) do
    {sub_sequence, _} =
      sequence
      |> Enum.split(size)

    if length(sub_sequence) < size do
      acc
    else
      [_ | tail] = sequence
      all_sub_sequences(tail, size, [sub_sequence | acc])
    end
  end
end
