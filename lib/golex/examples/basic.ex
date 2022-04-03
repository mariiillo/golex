defmodule Golex.Examples.Basic do
  alias Golex.Core.Cell

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
      {3, 3} => %Cell{status: 'dead'}
    }
  end
end
