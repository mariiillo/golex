defmodule Golex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Golex.Boundary.WorldManager, [name: Golex.Boundary.WorldManager]},
      {Registry, [name: Golex.Registry.WorldSession, keys: :unique]},
      {DynamicSupervisor, [name: Golex.Supervisor.WorldSession, strategy: :one_for_one]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mastery.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
