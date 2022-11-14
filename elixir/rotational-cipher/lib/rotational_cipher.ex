defmodule RotationalCipher do
  @lower ?a..?z
  @upper ?A..?Z

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist()
    |> Enum.map(&apply_shift(&1, shift))
    |> to_string()
  end

  defp apply_shift(c, shift) when c in @lower, do: ?a + rem(c - ?a + shift, 26)
  defp apply_shift(c, shift) when c in @upper, do: ?A + rem(c - ?A + shift, 26)
  defp apply_shift(c, _shift), do: c
end
