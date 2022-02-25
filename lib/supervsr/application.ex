defmodule Supervsr.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
    #  {Supervsr, ["Koni"]}, => would be Supervsr.queue

    {Task.Supervisor, name: Supervsr.TaskSupervisor}
    # iex> {:ok, pid} = Task.Supervisor.start_child(Supervisr.TaskSupervisor, fn -> background_work end)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Supervsr.Supervisor, restart: :permanent, shutdown: 5_000]
    Supervisor.start_link(children, opts)
  end
end


# There are three different strategies:

# :one_for_one - Only restart the failed child process
# :one_for_all - Restart all child processes in the event of a failure.
# :rest_for_one - Restart the failed process and any process start after it.
