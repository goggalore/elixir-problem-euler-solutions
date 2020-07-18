defmodule PE.Prime do
  @moduledoc """
  Documentation for `PE.Prime`.
  """

  @doc """
  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

  What is the 10 001st prime number?

  """

  def get(index) do
    Prime.get_prime(index)
  end
end
