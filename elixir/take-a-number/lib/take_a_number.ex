defmodule TakeANumber do
  def start(state \\ 0) do
    spawn(fn -> loop(state) end)
  end

  defp loop(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        loop(state)

      {:take_a_number, sender_pid} ->
        state = state + 1
        send(sender_pid, state)
        loop(state)

      :stop ->
        Process.exit(self(), :kill)

      _ ->
        loop(state)
    end
  end
end
