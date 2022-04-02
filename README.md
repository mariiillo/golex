# Golex

## Layers
### Functional Core
Composed by `Golex.Core.World` and `Golex.Core.Cell` modules. All the business logic is modelled there using just pure functions.

### Boundary
`Golex.Boundary.WorldManager` and `Golex.Boundary.WorldSession` are defined.
* `WorldManager` allows to create, get and destroy worlds.
* `WorldSession` allows the interaction with one world.

### Lifecycle management
`Golex.Application` defines a supervisor with three children:
* `Golex.Boundary.WorldManager`, which gets startet when the application starts.
* `Registry`
* `DynamicSupervisor`, which starts a new `Colex.Boundary.WorldSession` when a world is selected and ready to be "ticked".

## Example Data
`Golex.Example.Basic` offers two methods to create a world with sample data and other to get a sample of a world's state.

## Playing around using the API
Open a iex session
```bash
iex -S mix
```

Execute the following commands in the interactive elixir console

```elixir
iex(1)> Golex.create_world "basic", Golex.Examples.Basic.state
:ok
iex(2)> session = Golex.pick_world("basic")
{"basic",
 %Golex.Core.World{
   generation: 0,
   name: "basic",
   state: %{
     ...
   }
 }}
iex(3)> Golex.tick(session)
{:ok,
 %Golex.Core.World{
   generation: 0,
   name: "basic",
   state: %{
     {0, 0} => %Golex.Core.Cell{status: 'alive'},
     {0, 1} => %Golex.Core.Cell{status: 'dead'},
     {0, 2} => %Golex.Core.Cell{status: 'dead'},
     {0, 3} => %Golex.Core.Cell{status: 'dead'},
     {1, 0} => %Golex.Core.Cell{status: 'alive'},
     {1, 1} => %Golex.Core.Cell{status: 'alive'},
     {1, 2} => %Golex.Core.Cell{status: 'dead'},
     {1, 3} => %Golex.Core.Cell{status: 'alive'},
     {2, 0} => %Golex.Core.Cell{status: 'dead'},
     {2, 1} => %Golex.Core.Cell{status: 'dead'},
     {2, 2} => %Golex.Core.Cell{status: 'alive'},
     {2, 3} => %Golex.Core.Cell{status: 'alive'},
     {3, 0} => %Golex.Core.Cell{status: 'alive'},
     {3, 1} => %Golex.Core.Cell{status: 'dead'},
     {3, 2} => %Golex.Core.Cell{status: 'alive'},
     {3, 3} => %Golex.Core.Cell{status: 'dead'}
   }
 }}
iex(4)> Golex.tick(session)
{:ok,
 %Golex.Core.World{
   generation: 1,
   name: "basic",
   state: %{
     {0, 0} => %Golex.Core.Cell{status: 'alive'},
     {0, 1} => %Golex.Core.Cell{status: 'alive'},
     {0, 2} => %Golex.Core.Cell{status: 'dead'},
     {0, 3} => %Golex.Core.Cell{status: 'dead'},
     {1, 0} => %Golex.Core.Cell{status: 'alive'},
     {1, 1} => %Golex.Core.Cell{status: 'alive'},
     {1, 2} => %Golex.Core.Cell{status: 'dead'},
     {1, 3} => %Golex.Core.Cell{status: 'alive'},
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
