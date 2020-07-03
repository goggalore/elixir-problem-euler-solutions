defmodule Prime do
  ## Wilson's theorem:
  ## any number n is a prime number <=> (n − 1)! + 1 is divisible by n
  @spec is_prime?(non_neg_integer) :: boolean
  def is_prime?(p) do
    rem(Factorial.of(p - 1) + 1, p) == 0
  end
end
