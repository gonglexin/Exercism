defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/
  end

  def split_line(line) do
    line
    |> String.split(~r/<(~|\*|=|-)*>/)
  end

  def remove_artifacts(line) do
    line
    |> String.replace(~r/end-of-line\d+/i, "")
  end

  def tag_with_user_name(line) do
    user =
      (Regex.named_captures(~r/User\s+(?<user>(\S)*)/, line) || %{})
      |> Map.get("user")

    case user do
      nil -> line
      user -> "[USER] #{user} #{line}"
    end
  end
end
