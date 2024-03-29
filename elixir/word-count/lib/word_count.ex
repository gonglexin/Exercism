defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r/[^[:alnum:]-\']+/u, trim: true)
    |> Enum.map(fn word -> String.trim(word, "'") end)
    # |> Enum.reduce(%{}, fn word, acc ->
    #   Map.update(acc, word, 1, &(&1 + 1))
    # end)
    |> Enum.frequencies()
  end
end
