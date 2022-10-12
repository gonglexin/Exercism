defmodule Bob do
  def hey(input) do
    cond do
      String.trim(input) == "" ->
        "Fine. Be that way!"

      all_upcase?(input) && has_letter?(input) && String.ends_with?(input, "?") ->
        "Calm down, I know what I'm doing!"

      all_upcase?(input) && has_letter?(input) ->
        "Whoa, chill out!"

      String.ends_with?(input, "?") ->
        "Sure."

      true ->
        "Whatever."
    end
  end

  defp all_upcase?(string) do
    String.upcase(string) == string
  end

  defp has_letter?(string) do
    String.upcase(string) != String.downcase(string)
  end
end
