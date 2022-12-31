defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}
  def classify(number) when is_integer(number) and number > 0 do
    aliquot_sum =
      number
      |> get_factors()
      |> Enum.sum()

    cond do
      aliquot_sum == number -> {:ok, :perfect}
      aliquot_sum > number -> {:ok, :abundant}
      true -> {:ok, :deficient}
    end
  end

  def classify(_number), do: {:error, "Classification is only possible for natural numbers."}

  @spec get_factors(number :: integer) :: list()
  defp get_factors(1), do: []
  defp get_factors(number) do
    Enum.reduce(1..number - 1, [], fn n, acc ->
      case Integer.mod(number, n) do
        0 -> [n | acc]
        _ -> acc
      end
    end)
  end
end
