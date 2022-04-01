defmodule Golex.Core.World do
  @moduledoc """
  here is the status of the whole world
  """
  
  alias Golex.Core.Cell
  
  defstruct ~w[generation state]a
  
  def new(state) do
    struct!(__MODULE__, state: state, generation: 0)
  end

  def next_generation(world) do
    next_generation = world.generation + 1

    struct!(__MODULE__, generation: next_generation, state: %{})
  end

  def calculate_alive_neighbours(world, position) do
    world.state
    |> pick_neighbours(position)
    |> filter_alive_cells
    |> count_alive_cells
  end

  defp pick_neighbours(state, {x, y}) do
    [
      Map.get(state, {x - 1, y - 1}),
      Map.get(state, {x - 1, y}),
      Map.get(state, {x - 1, y + 1}),
      Map.get(state, {x + 1, y - 1}),
      Map.get(state, {x + 1, y}),
      Map.get(state, {x + 1, y + 1}),
      Map.get(state, {x, y - 1}),
      Map.get(state, {x, y + 1}),
    ] |> remove_invalids
  end

  defp remove_invalids(cells) do
    cells
    |> Enum.filter(& &1)
  end

  defp filter_alive_cells(cells) do
   cells
   |> Enum.filter(&Cell.alive?/1)
  end

  defp count_alive_cells(cells) do
   cells
   |> Enum.count
  end
end
