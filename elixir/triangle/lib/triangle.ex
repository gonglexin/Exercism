defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, a, a) when a > 0 do
    {:ok, :equilateral}
  end

  def kind(a, a, c) when a > 0 and c > 0 and a * 2 > c do
    {:ok, :isosceles}
  end

  def kind(a, b, a) when a > 0 and b > 0 and a * 2 > b do
    {:ok, :isosceles}
  end

  def kind(a, b, b) when a > 0 and b > 0 and b * 2 > a do
    {:ok, :isosceles}
  end

  def kind(a, b, c) when a > 0 and b > 0 and c > 0 and a + b > c and a + c > b and b + c > a do
    {:ok, :scalene}
  end

  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0 do
    {:error, "all side lengths must be positive"}
  end

  def kind(_, _, _) do
    {:error, "side lengths violate triangle inequality"}
  end
end
