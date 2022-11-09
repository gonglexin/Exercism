defmodule NameBadge do
  def print(id, name, department) do
    department = if is_nil(department), do: "OWNER", else: String.upcase(department)

    if is_nil(id) do
      "#{name} - #{department}"
    else
      "[#{id}] - #{name} - #{department}"
    end
  end
end
