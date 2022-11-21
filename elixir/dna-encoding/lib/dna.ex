defmodule DNA do
  @nucleotide_to_code %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }

  @code_to_nucleotide @nucleotide_to_code |> Enum.into(%{}, fn {k, v} -> {v, k} end)

  def encode_nucleotide(code_point), do: @nucleotide_to_code[code_point]
  def decode_nucleotide(encoded_code), do: @code_to_nucleotide[encoded_code]

  def encode([]), do: <<>>
  def encode([head | tail]), do: <<encode_nucleotide(head)::4, encode(tail)::bitstring>>

  def decode(<<>>), do: ''
  def decode(<<head::4, tail::bitstring>>), do: [decode_nucleotide(head) | decode(tail)]
end
