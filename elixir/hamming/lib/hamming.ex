defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2) do
    {:error, "strands must be of equal length"}
  end

  def hamming_distance(strand1, strand2) do
    distance =
      strand1
      |> Enum.with_index()
      |> Enum.count(fn {char, index} -> Enum.at(strand2, index) != char end)

    {:ok, distance}
  end
end
