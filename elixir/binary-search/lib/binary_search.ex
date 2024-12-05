defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    do_search(Tuple.to_list(numbers), key, 0)
  end

  defp do_search([], _key, _index), do: :not_found

  defp do_search([key], key, index), do: {:ok, index}

  defp do_search([v], key, _index) when v != key, do: :not_found

  defp do_search(numbers, key, index) do
    middle_index = length(numbers) |> div(2)

    middle_value = Enum.at(numbers, middle_index)

    cond do
      key == middle_value ->
        {:ok, index + middle_index}

      key > middle_value ->
        numbers = Enum.slice(numbers, (middle_index + 1)..-1//1)
        do_search(numbers, key, index + middle_index + 1)

      true ->
        numbers = Enum.slice(numbers, 0..(middle_index - 1))
        do_search(numbers, key, index)
    end
  end
end
