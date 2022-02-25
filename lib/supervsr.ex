defmodule Supervsr do
  use GenServer

  # Child Specification
  def child_spec(opts) do
    %{
      id: Supervsr,
      start: {__MODULE__, :start_link, [opts]},
      shutdown: 5_000,
      restart: :permanent,
      type: :worker
    }
  end

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def handle_call(:queue, _from, state), do: {:reply, state, state}

  def init(state), do: {:ok, state}

  def queue, do: GenServer.call(__MODULE__, :queue)

end
