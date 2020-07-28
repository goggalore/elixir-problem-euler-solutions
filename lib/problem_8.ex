defmodule PE.SeriesProduct do
  require Integer

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
