defmodule PE.Grid do
  @spec max_hvd_product([[integer]], integer) :: integer
  def max_hvd_product(grid, size) do
    tasks = [
      Task.async(fn -> max_horizontal_product(grid, size, 0) end),
      Task.async(fn -> max_vertical_product(grid, size, 0) end),
      Task.async(fn -> max_left_diagonal_product(grid, size, 0) end),
      Task.async(fn -> max_right_diagonal_product(grid, size, 0) end)
    ]

    Enum.map(tasks, &Task.await/1)
    |> Enum.max()
  end

  @spec max_horizontal_product([[integer]], integer) :: integer
  def max_horizontal_product(grid, size) do
    max_horizontal_product(grid, size, 0)
  end

  @spec max_vertical_product([[integer]], integer) :: integer
  def max_vertical_product(grid, size) do
    max_vertical_product(grid, size, 0)
  end

  @spec max_left_diagonal_product([[integer]], integer) :: integer
  def max_left_diagonal_product(grid, size) do
    max_left_diagonal_product(grid, size, 0)
  end

  @spec max_right_diagonal_product([[integer]], integer) :: integer
  def max_right_diagonal_product(grid, size) do
    max_right_diagonal_product(grid, size, 0)
  end

  defp max_horizontal_product(grid, size, current_max) do
    case grid do
      [] ->
        current_max

      [row | remaining] ->
        current_row_max = max_row_product(row, size)
        max = if current_row_max < current_max, do: current_max, else: current_row_max
        max_horizontal_product(remaining, size, max)
    end
  end

  defp max_row_product(row, size) do
    all_sub_sequences(row, size, [])
    |> Enum.map(fn sub_sequence -> Enum.reduce(sub_sequence, &*/2) end)
    |> Enum.max()
  end

  defp all_sub_sequences(sequence, size, sub_sequences) do
    {sub_sequence, _} = Enum.split(sequence, size)

    if length(sub_sequence) < size do
      sub_sequences
    else
      [_ | remaining] = sequence
      all_sub_sequences(remaining, size, [sub_sequence | sub_sequences])
    end
  end

  defp max_vertical_product(grid, size, current_max) do
    reversed_transpose = reverse_and_transpose(grid)
    max_horizontal_product(reversed_transpose, size, current_max)
  end

  # we don't care if the tranpose is in order or not,
  # so we reverse and tranpose because it's fast
  defp reverse_and_transpose(grid) do
    reverse_and_transpose(grid, [], [], [])
  end

  defp reverse_and_transpose(grid, next_grid, current_column, columns) do
    case grid do
      [row | _] when row == [] ->
        columns

      [row | remaining_grid] ->
        [num | remaining_row] = row

        reverse_and_transpose(
          remaining_grid,
          [remaining_row | next_grid],
          [num | current_column],
          columns
        )

      [] ->
        reverse_and_transpose(next_grid, [], [], [current_column | columns])
    end
  end

  defp max_left_diagonal_product(grid, size, current_max) do
    if length(grid) < size do
      current_max
    else
      sub_grid = Enum.slice(grid, 0..(size - 1))
      repositioned = reposition_for_diagonal_product(sub_grid, 0, [])
      vertical_product = max_vertical_product(repositioned, size, 0)
      max = if vertical_product > current_max, do: vertical_product, else: current_max
      [_ | remaining_rows] = grid
      max_left_diagonal_product(remaining_rows, size, max)
    end
  end

  defp reposition_for_diagonal_product(grid, index, acc) do
    case grid do
      [] ->
        acc

      [row | remaining_grid] ->
        {_, repositioned} = Enum.split(row, index)
        reposition_for_diagonal_product(remaining_grid, index + 1, [repositioned | acc])
    end
  end

  defp max_right_diagonal_product(grid, size, current_max) do
    reversed =
      grid
      |> Enum.map(&Enum.reverse/1)

    max_left_diagonal_product(reversed, size, current_max)
  end
end
