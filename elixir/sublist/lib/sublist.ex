defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(_, []), do: :superlist
  def compare([], _), do: :sublist

  def compare(a, b) do
    if String.contains?(Enum.join(b), Enum.join(a)) && Enum.all?(a, fn x -> x in b end) do
      :sublist
    else
      if String.contains?(Enum.join(a), Enum.join(b)) && Enum.all?(b, fn x -> x in a end) do
        :superlist
      else
        :unequal
      end
    end
  end
end
