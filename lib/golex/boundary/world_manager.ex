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

  def start_link(options \\ []) do
    GenServer.start_link(__MODULE__, %{}, options)
  end

  def create_world(manager \\ __MODULE__, {name, state}) do
    GenServer.call(manager, {:create_world, {name, state}})
  end

  def destroy_world(manager \\ __MODULE__, name) do
    GenServer.call(manager, {:destroy_world, name})
  end

  def lookup_world_by_id(manager \\ __MODULE__, name) do
    GenServer.call(manager, {:lookup_world_by_id, name})
  end

  def handle_call({:create_world, {name, state}}, _from, worlds) do
    world = World.new(name, state)
    new_worlds = Map.put(worlds, name, world)
    {:reply, :ok, new_worlds}
  end

  def handle_call({:destroy_world, name}, _from, worlds) do
    new_worlds = Map.delete(worlds, name)
    {:reply, :ok, new_worlds}
  end

  def handle_call({:lookup_world_by_id, name}, _from, worlds) do
    {:reply, worlds[name], worlds}
  end
end
