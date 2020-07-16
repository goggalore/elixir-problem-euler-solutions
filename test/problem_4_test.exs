defmodule PE.PalindromeTest do
  use ExUnit.Case, async: true

  test "checking if 9341 is a palindrome is false" do
    assert !PE.Palindrome.is_palindrome?(9341)
  end

  test "checking if 9009 is a palindrome is true" do
    assert PE.Palindrome.is_palindrome?(9009)
  end

  test "checking if 12823 is a palindrome is false" do
    assert !PE.Palindrome.is_palindrome?(12823)
  end

  test "checking if 12821 is a palindrome is true" do
    assert PE.Palindrome.is_palindrome?(12821)
  end
end
