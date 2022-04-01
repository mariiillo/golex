defmodule WorldTest do
use ExUnit.Case
  alias Golex.Core.{World, Cell}

  def setup_function(context) do
    {:ok, Map.put(context, :state, state())}
  end

  def state do
    %{
      {0, 0} => %Cell{status: 'alive'},
      {0, 1} => %Cell{status: 'dead'},
      {0, 2} => %Cell{status: 'dead'},
      {0, 3} => %Cell{status: 'dead'},
      {1, 0} => %Cell{status: 'alive'},
      {1, 1} => %Cell{status: 'alive'},
      {1, 2} => %Cell{status: 'dead'},
      {1, 3} => %Cell{status: 'alive'},
      {2, 0} => %Cell{status: 'dead'},
      {2, 1} => %Cell{status: 'dead'},
      {2, 2} => %Cell{status: 'alive'},
      {2, 3} => %Cell{status: 'alive'},
      {3, 0} => %Cell{status: 'alive'},
      {3, 1} => %Cell{status: 'dead'},
      {3, 2} => %Cell{status: 'alive'},
      {3, 3} => %Cell{status: 'dead'},
    }
  end

  defp assert_generation(world, expected_generation) do
    assert world.generation == expected_generation
    world
  end

  describe "World" do
    setup [:setup_function]

    test 'it keeps track of the generation numbert', %{state: state} do
      world = World.new(state)

      World.next_generation(world)
      |> assert_generation(1)
      |> World.next_generation
      |> assert_generation(2)
      |> World.next_generation
      |> assert_generation(3)
    end

    test 'calculates the alive neighbours of cells in the corners', %{state: state} do
      world = World.new(state)

      assert World.calculate_alive_neighbours(world, {0, 0}) == 2
      assert World.calculate_alive_neighbours(world, {3, 0}) == 0
      assert World.calculate_alive_neighbours(world, {0, 3}) == 1
      assert World.calculate_alive_neighbours(world, {3, 3}) == 3
    end

    test 'calculates the alive neighbours of cells at the border', %{state: state} do
      world = World.new(state)

      assert World.calculate_alive_neighbours(world, {0, 1}) == 3
      assert World.calculate_alive_neighbours(world, {0, 2}) == 2
      assert World.calculate_alive_neighbours(world, {1, 0}) == 2
      assert World.calculate_alive_neighbours(world, {2, 0}) == 3
      assert World.calculate_alive_neighbours(world, {3, 1}) == 3
      assert World.calculate_alive_neighbours(world, {3, 2}) == 2
      assert World.calculate_alive_neighbours(world, {1, 3}) == 2
      assert World.calculate_alive_neighbours(world, {2, 3}) == 3
    end

    test 'calculates the alive neighbours of cells in the middle', %{state: state} do
      world = World.new(state)

      assert World.calculate_alive_neighbours(world, {1, 1}) == 3
      assert World.calculate_alive_neighbours(world, {1, 2}) == 4
      assert World.calculate_alive_neighbours(world, {2, 1}) == 5
      assert World.calculate_alive_neighbours(world, {2, 2}) == 4
    end
  end
end
