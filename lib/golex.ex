defmodule Golex do
  @moduledoc """
  Documentation for `Golex`.
  """

  alias Golex.Boundary.WorldManager

  @doc """
  Hello world.

  ## Examples

      iex> Golex.hello()
      :world

  """
  def hello do
    :world
  end

  def start_world_manager() do
    GenServer.start_link(WorldManager, %{}, name: WorldManager)
  end

  def create_world(state) do
    GenServer.call(WorldManager, {:create_world, state})
  end
end
