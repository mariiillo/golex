defmodule Golex.Core.Cell do
  @moduledoc """
  This defines the building block of the game, a single cell
  """

  defstruct ~w[status]a

  def next_generation(cell, alive_neigbours) do
    new_status = calculate_new_status(cell.status, alive_neigbours)

    struct!(__MODULE__, status: new_status)
  end
  
  def alive?(cell) do
    cell.status == 'alive'
  end

  defp calculate_new_status('dead', 3) do
    'alive'
  end

  defp calculate_new_status('dead', alive_neigbours) when alive_neigbours != 3 do
    'dead'
  end

  defp calculate_new_status('alive', alive_neigbours) when alive_neigbours < 2 do
    'dead'
  end

  defp calculate_new_status('alive', alive_neigbours) when alive_neigbours in [2, 3] do
    'alive'
  end

  defp calculate_new_status('alive', alive_neigbours) when alive_neigbours > 3 do
    'dead'
  end
end
