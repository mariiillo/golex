defmodule Golex.Boundary.WorldSession do
  @moduledoc """
  This handles the actions with a specific world
  """
  alias Golex.Core.World
  use GenServer

  def init(world) do
    {:ok, world}
  end

  def tick(session) do
    GenServer.call(session, :tick)
  end

  def handle_call(:tick, _from, world) do
    new_generation =
      world
      |> World.next_generation()

    {:reply, {:ok, world}, new_generation}
  end
end
