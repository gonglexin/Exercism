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
        c when c in @lower -> @lower |> Stream.cycle() |> Enum.at(c - ?a + shift)
        c when c in @upper -> @upper |> Stream.cycle() |> Enum.at(c - ?A + shift)
        _ -> c
      end
    end)
    |> to_string()
  end
end
