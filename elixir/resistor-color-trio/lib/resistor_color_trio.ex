defmodule ResistorColorTrio do
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label([c1, c2, c3]) do
    first = [@colors[c1], @colors[c2]] |> Integer.undigits

    second = @colors[c3]

    ohms = first * :math.pow(10, second) |> round()

    if ohms < 1000, do: {ohms, :ohms}, else: {div(ohms, 1000), :kiloohms}
  end
end
