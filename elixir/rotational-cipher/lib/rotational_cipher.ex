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
    |> String.to_charlist()
    |> Enum.map(fn c ->
      case c do
        c when c in @lower -> ?a + rem(c - ?a + shift, 26)
        c when c in @upper -> ?A + rem(c - ?A + shift, 26)
        _ -> c
      end
    end)
    |> to_string()
  end
end
