defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(_, []), do: :superlist
  def compare([], _), do: :sublist

  def compare(a, b) do
    cond do
      String.contains?(Enum.join(a, "-") <> "-", Enum.join(b, "-") <> "-") -> :superlist
      String.contains?(Enum.join(b, "-") <> "-", Enum.join(a, "-") <> "-") -> :sublist
      true -> :unequal
    end
  end
end
