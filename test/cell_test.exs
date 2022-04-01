defmodule CellTest do
  use ExUnit.Case
  alias Golex.Core.Cell

  test "a dead cell revives if it has 3 alive neighbours" do
    cell = %Cell{status: 'dead'}

    assert Cell.next_generation(cell, 3) == %Cell{status: 'alive'}
  end

  test "a dead cell will still be dead if it has more or less than 3 alive neighbours" do
    cell = %Cell{status: 'dead'}

    assert Cell.next_generation(cell, 0) == %Cell{status: 'dead'}
    assert Cell.next_generation(cell, 1) == %Cell{status: 'dead'}
    assert Cell.next_generation(cell, 2) == %Cell{status: 'dead'}
    assert Cell.next_generation(cell, 4) == %Cell{status: 'dead'}
    assert Cell.next_generation(cell, 5) == %Cell{status: 'dead'}
    assert Cell.next_generation(cell, 6) == %Cell{status: 'dead'}
    assert Cell.next_generation(cell, 7) == %Cell{status: 'dead'}
    assert Cell.next_generation(cell, 8) == %Cell{status: 'dead'}
  end

  test "a living cell dies if it has less than 2 alive neighbours" do
    cell = %Cell{status: 'alive'}

    assert Cell.next_generation(cell, 1) == %Cell{status: 'dead'}
    assert Cell.next_generation(cell, 0) == %Cell{status: 'dead'}
  end

  test "a living cell keeps living if it has 2 or 3 alive neighbours" do
    cell = %Cell{status: 'alive'}

    assert Cell.next_generation(cell, 2) == %Cell{status: 'alive'}
    assert Cell.next_generation(cell, 3) == %Cell{status: 'alive'}
  end

  test "a living cell dies if it has more than 3 alive neighbours" do
    cell = %Cell{status: 'alive'}

    assert Cell.next_generation(cell, 4) == %Cell{status: 'dead'}
    assert Cell.next_generation(cell, 5) == %Cell{status: 'dead'}
    assert Cell.next_generation(cell, 6) == %Cell{status: 'dead'}
    assert Cell.next_generation(cell, 7) == %Cell{status: 'dead'}
    assert Cell.next_generation(cell, 8) == %Cell{status: 'dead'}
  end

  describe "alive" do
    test "returns true if the cell is alive" do
      cell = %Cell{status: 'alive'}

      assert Cell.alive?(cell) == true
    end

    test "returns false if the cell is dead" do
      cell = %Cell{status: 'dead'}

      assert Cell.alive?(cell) == false
    end
  end
end
