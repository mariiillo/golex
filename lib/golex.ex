defmodule Golex do
  @moduledoc """
  Documentation for `Golex`.
  """

  alias Golex.Boundary.{WorldManager, WorldSession}
  alias Golex.Core.World

  def create_world(name, state) do
    GenServer.call(WorldManager, {:create_world, {name, state}})
  end

  def pick_world(name) do
    with %World{} = world <- WorldManager.lookup_world_by_id(name),
         {:ok, _} <- WorldSession.start_session({name, world})
    do
      {:ok, name}
    else
      error -> error
    end
  end

  def tick(name) do
    WorldSession.tick(name)
  end
end
