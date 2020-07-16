defmodule PE.PalindromeTest do
  use ExUnit.Case, async: true

  test "checking if 4141 is a palindrome is false" do
    assert !PE.Palindrome.is_palindrome?(4141)
  end

  test "checking if 900009 is a palindrome is true" do
    assert PE.Palindrome.is_palindrome?(900_009)
  end

  test "checking if 96696 is a palindrome is false" do
    assert !PE.Palindrome.is_palindrome?(96696)
  end

  test "checking if 12821 is a palindrome is true" do
    assert PE.Palindrome.is_palindrome?(12821)
  end

  test "The largest palindrome made from the product of two 3-digit numbers is 906609" do
    assert PE.Palindrome.max_palindrome_of_three_digit_pair_product() == 906_609
  end
end
