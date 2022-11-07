defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
    username
    |> Enum.map(fn l ->
      case l do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        ?_ -> l
        l when l in 97..122 -> l
        _   -> nil
      end
    end)
    |> Enum.reject(&is_nil/1)
    |> List.flatten()
  end
end
