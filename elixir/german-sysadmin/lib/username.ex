defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    username
    |> Enum.map(fn l ->
      case l do
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        ?_ -> l
        l when l in ?a..?z -> l
        _   -> ''
      end
    end)
    |> List.flatten()
  end
end
