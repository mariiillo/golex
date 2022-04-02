# Golex

## Layers
### Functional Core
Composed by `Golex.Core.World` and `Golex.Core.Cell` modules. All the business logic is modelled there using just pure functions.

### Boundary
`Golex.Boundary.WorldManager` and `Golex.Boundary.WorldSession` are defined.
* `WorldManager` allows to create, get and destroy worlds.
* `WorldSession` allows the interaction with one world.

### Service API
`golex.ex` defines a very simple API that abstract all the details from the other layers.

## Example Data
`Golex.Example.Basic` offers two methods to create a world with sample data and other to get a sample of a world's state.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `golex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:golex, "~> 0.1.0"}
  ]
end
```

## Playing around using the API
```bash
iex -S mix
```

Execute the following commands in the interactive elixir console

```elixir
iex(1)> alias Golex.Examples.Basic
Golex.Examples.Basic
iex(2)> Golex.start_world_manager
{:ok, #PID<0.220.0>}
iex(3)> Golex.create_world Basic.state
:ok
iex(4)> session = Golex.start(1)
#PID<0.223.0>
iex(5)> Golex.tick(session)
{:ok,
 %Golex.Core.World{
   generation: 2,
   state: %{
     {0, 0} => %Golex.Core.Cell{status: 'alive'},
     {0, 1} => %Golex.Core.Cell{status: 'alive'},
     {0, 2} => %Golex.Core.Cell{status: 'alive'},
     {0, 3} => %Golex.Core.Cell{status: 'dead'},
     {1, 0} => %Golex.Core.Cell{status: 'dead'},
     {1, 1} => %Golex.Core.Cell{status: 'dead'},
     {1, 2} => %Golex.Core.Cell{status: 'dead'},
     {1, 3} => %Golex.Core.Cell{status: 'dead'},
     {2, 0} => %Golex.Core.Cell{status: 'alive'},
     {2, 1} => %Golex.Core.Cell{status: 'dead'},
     {2, 2} => %Golex.Core.Cell{status: 'dead'},
     {2, 3} => %Golex.Core.Cell{status: 'alive'},
     {3, 0} => %Golex.Core.Cell{status: 'dead'},
     {3, 1} => %Golex.Core.Cell{status: 'alive'},
     {3, 2} => %Golex.Core.Cell{status: 'alive'},
     {3, 3} => %Golex.Core.Cell{status: 'alive'}
   }
 }}
```
