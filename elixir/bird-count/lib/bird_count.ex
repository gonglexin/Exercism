defmodule BirdCount do
  def today([]), do: nil

  def today(list), do: hd(list)

  def increment_day_count([]), do: [1]

  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?(list) do
    list
    |> Enum.any?(&(&1 == 0))
  end

  def total(list) do
    Enum.sum(list)
  end

  def busy_days(list) do
    list
    |> Enum.reject(&(&1 < 5))
    |> Enum.count()
  end
end
