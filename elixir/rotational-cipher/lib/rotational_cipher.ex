defmodule RotationalCipher do
  @lower ?a..?z
  @upper ?A..?Z

  @lower_index @lower |> Enum.with_index() |> Enum.into(%{})
  @upper_index @upper |> Enum.with_index() |> Enum.into(%{})

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
        c when c in @lower -> @lower |> Enum.at(rem(@lower_index[c] + shift, 26))
        c when c in @upper -> @upper |> Enum.at(rem(@upper_index[c] + shift, 26))
        _ -> c
      end
    end)
    |> to_string()
  end
end
