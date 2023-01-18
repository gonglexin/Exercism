defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/\s|-|_/)
    |> Enum.map(&String.at(&1, 0))
    |> Enum.reject(&is_nil/1)
    |> Enum.map(&String.upcase/1)
    |> Enum.join()
  end
end
