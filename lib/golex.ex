defmodule Golex do
  @moduledoc """
  Documentation for `Golex`.
  """

  alias Golex.Boundary.{WorldManager, WorldSession}
  alias Golex.Core.World

  def start_world_manager() do
    GenServer.start_link(WorldManager, %{}, name: WorldManager)
  end

  def create_world(state) do
    GenServer.call(WorldManager, {:create_world, state})
    :ok
  end

  def start(id) do
    with %World{} = world <- WorldManager.lookup_world_by_id(id),
         {:ok, session} <- GenServer.start_link(WorldSession, world)
    do
      session
    else
      error -> error
    end
  end

  def tick(session) do
    GenServer.call(session, :tick)
  end
end
