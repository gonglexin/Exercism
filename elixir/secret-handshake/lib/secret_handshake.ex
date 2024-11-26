defmodule SecretHandshake do
  import Bitwise

  @actions %{
    0b0001 => "wink",
    0b0010 => "double blink",
    0b0100 => "close your eyes",
    0b1000 => "jump"
  }

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    result =
      0..3
      |> Enum.map(fn i ->
        x = code &&& Integer.pow(2, i)
        @actions[x]
      end)
      |> Enum.reject(&is_nil/1)

    if (code &&& 0b10000) != 0, do: Enum.reverse(result), else: result
  end
end
