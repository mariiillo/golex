defmodule Golex.Boundary.WorldManager do
  @moduledoc """
  Manages the Worlds
  """
  alias Golex.Core.World
  use GenServer

  def init(worlds) when is_map(worlds) do
    {:ok, worlds}
  end

  def init(_worlds), do: {:error, "state must be a map"}

  def create_world(manager \\ __MODULE__, state) do
    GenServer.call(manager, {:create_world, state})
  end

  def destroy_world(manager \\ __MODULE__, id) do
    GenServer.call(manager, {:destroy_world, id})
  end

  def lookup_world_by_id(manager \\ __MODULE__, id) do
   GenServer.call(manager, {:lookup_world_by_id, id})
  end

  def handle_call({:create_world, state}, _from, worlds) do
    next_id = Enum.count(worlds) + 1
    world = World.new(state)
    new_worlds = Map.put(worlds, next_id, world)
    {:reply, :ok, new_worlds}
  end

  def handle_call({:destroy_world, id}, _from, worlds) do
    new_worlds = Map.delete(worlds, id)
    {:reply, :ok, new_worlds}
  end

  def handle_call({:lookup_world_by_id, id}, _from, worlds) do
    {:reply, worlds[id], worlds}
  end
end
