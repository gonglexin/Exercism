defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    cond do
      evenly_divisible?(year, 4) and not evenly_divisible?(year, 100) -> true
      evenly_divisible?(year, 100) and evenly_divisible?(year, 400) -> true
      true -> false
    end
  end

  defp evenly_divisible?(dividend, divisor) when rem(dividend, divisor) == 0, do: true
  defp evenly_divisible?(_, _), do: false
end
