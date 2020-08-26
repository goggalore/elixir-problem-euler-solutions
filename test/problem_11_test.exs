defmodule PE.GridTest do
  use ExUnit.Case, async: true

  alias PE.Grid, as: Grid

  setup do
    grids = %{
      horizontal: [
        [1, 1, 1, 1],
        [10, 10, 3, 1],
        [1, 1, 1, 1]
      ],
      vertical: [
        [1, 1, 1],
        [1, 2, 1],
        [1, 10, 1],
        [1, 10, 1]
      ],
      left_diagonal: [
        [1, 1, 1, 1],
        [1, 6, 1, 1],
        [1, 1, 10, 1],
        [1, 1, 1, 6]
      ],
      right_diagonal: [
        [1, 1, 1, 7],
        [1, 1, 2, 1],
        [1, 10, 1, 1],
        [1, 1, 1, 1]
      ]
    }

    %{grids: grids}
  end

  test "The greatest horizontal 3 product of the horizontal grid is 300", %{
    grids: %{horizontal: horizontal_grid}
  } do
    assert Grid.max_horizontal_product(horizontal_grid, 3) == 300
  end

  test "The greatest vertical 3 product of the vertical grid is 200", %{
    grids: %{vertical: vertical_grid}
  } do
    assert Grid.max_vertical_product(vertical_grid, 3) == 200
  end

  test "The max left diagonal 3 product of the left diagonal grid is 360", %{
    grids: %{left_diagonal: left_diagonal_grid}
  } do
    assert Grid.max_left_diagonal_product(left_diagonal_grid, 3) == 360
  end

  test "The max right diagonal 3 product of the right diagonal grid is 140", %{
    grids: %{right_diagonal: right_diagonal_grid}
  } do
    assert Grid.max_right_diagonal_product(right_diagonal_grid, 3) == 140
  end
end
