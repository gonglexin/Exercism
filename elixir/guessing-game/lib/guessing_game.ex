defmodule GuessingGame do
  def compare(secret_number, _guess \\ nil)
  def compare(secret_number, guess) when is_number(guess) and secret_number == guess, do: "Correct"
  def compare(secret_number, guess) when is_number(guess) and guess == secret_number + 1, do: "So close"
  def compare(secret_number, guess) when is_number(guess) and guess == secret_number - 1, do: "So close"
  def compare(secret_number, guess) when is_number(guess) and guess > secret_number, do: "Too high"
  def compare(secret_number, guess) when is_number(guess) and guess < secret_number, do: "Too low"
  def compare(_secret_number, _), do: "Make a guess"
end
