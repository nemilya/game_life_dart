Game Life by Dart
=================

Game
----

- `set_world(ascii_map)`
- `step()`
- `get_world_as_acsii()` 

World
-----

- `parse(ascii_map)`
- `rows, cols`
- `set_cell(row, col, cell_state)`
- `get_cell_at(row, col)` 
- `neighbors_cnt_at(row, col)`
- `as_ascii()`

Cell
----

- `self.next_generation(cell_state, neighbors_cnt)`

Testing
-------

    sudo apt install inotify-tools
    inotifywait -m -e CLOSE_WRITE ./lib ./test | xargs -n1 -I{} dart test

