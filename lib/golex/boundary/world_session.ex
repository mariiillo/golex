defmodule Golex.Boundary.WorldSession do
  @moduledoc """
  This handles the actions with a specific world
  """
  alias Golex.Core.World
  use GenServer

  def init({name, world}) do
    {:ok, {name, world}}
  end

  def child_spec({name, world}) do
    %{
      id: {__MODULE__, {name, world}},
      start: {__MODULE__, :start_link, [{name, world}]},
      restart: :temporary
    }
  end

  def start_link({name, world}) do
    GenServer.start_link(__MODULE__, {name, world}, name: via(name))
  end

  def via(name) do
    {
      :via,
      Registry,
      {Golex.Registry.WorldSession, name}
    }
  end

  def start_session({name, world}) do
    DynamicSupervisor.start_child(
      Golex.Supervisor.WorldSession,
      {__MODULE__, {name, world}}
    )
  end

  def tick(name) do
    GenServer.call(via(name), :tick)
  end

  def handle_call(:tick, _from, {name, world}) do
    new_generation =
      world
      |> World.next_generation()

    {:reply, {:ok, world}, {name, new_generation}}
  end
end
