defmodule PE.SpecialPythagoreanTripletTest do
  use ExUnit.Case, async: true

  test "The pythagorean triplet that equals 0 when summed is {0, 0, 0}" do
    assert PE.SpecialPythagoreanTriplet.find_triplet(0) == {:ok, {0, 0, 0}}
  end

  test "The pythagorean triplet of a negative sum returns an error" do
    {status, _} = PE.SpecialPythagoreanTriplet.find_triplet(-100)
    assert status == :error
  end

  test "The pythagorean triplet of NaN sum returns an error" do
    {status, _} = PE.SpecialPythagoreanTriplet.find_triplet("hey")
    assert status == :error
  end

  test "The pythagorean triplet that equals 30 when summed is {5, 12, 13}" do
    {_, triplet} = PE.SpecialPythagoreanTriplet.find_triplet(30)
    assert triplet == {5, 12, 13}
  end

  test "The product of the triplet that equals 30 when summed is 780" do
    assert PE.SpecialPythagoreanTriplet.product(30) == 780
  end

  test "The prodcut of the triplet that equals 1000 when summed is 31875000" do
    assert PE.SpecialPythagoreanTriplet.product(1000) == 31_875_000
  end
end
