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
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([c1, c2, c3 | _]) do
    first = [@colors[c1], @colors[c2]] |> Integer.undigits()

    second = @colors[c3]

    ohms = (first * :math.pow(10, second)) |> round()

    s = ohms |> to_string()

    cond do
      s |> String.ends_with?("000000000") ->
        {div(ohms, 1_000_000_000), :gigaohms}

      s |> String.ends_with?("000000") ->
        {div(ohms, 1_000_000), :megaohms}

      s |> String.ends_with?("000") ->
        {div(ohms, 1000), :kiloohms}

      true ->
        {ohms, :ohms}
    end
  end
end
