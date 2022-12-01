defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1[:price]))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(is_nil(&1[:price])))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn i ->
      Map.replace(i, :name, String.replace(i[:name], old_word, new_word))
    end)
  end

  def increase_quantity(item, count) do
    Map.update!(item, :quantity_by_size, fn m ->
      Enum.into(m, %{}, fn {k, v} -> {k, v + count} end)
    end)
  end

  def total_quantity(item) do
    Enum.reduce(item[:quantity_by_size], 0, fn {_size, quantity}, acc -> acc + quantity end)
  end
end
