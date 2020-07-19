defmodule PE.RangeDivisibleTest do
  use ExUnit.Case, async: true

  test "The smallest number divisible by 1..10 is " do
    assert PE.RangeDivisible.find(10) == 2520
  end

  test "The smallest number divisible by 1..20 is 232792560" do
    assert PE.RangeDivisible.find(20) == 232_792_560
  end
end
