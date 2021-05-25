Game Life by Dart
=================

OOA/OOP, TDD.

Conway's Game of Life

- Any live cell with two or three live neighbours survives.
- Any dead cell with three live neighbours becomes a live cell.
- All other live cells die in the next generation. Similarly, all other dead cells stay dead.

Game
----

- `set_world(ascii_map)`
- `step()`
- `get_world_as_acsii()` 

World
-----

- `init(rows, cols)`
- `rowsCnt(), colsCnt()`
- `get_cell_at(row, col)` 
- `set_cell(row, col, cell_state)`
- `parse(ascii_map)`
- `neighbors_cnt_at(row, col)`
- `as_ascii()`

Cell
----

- `enum CellState`
- `self.ascii_to_cell_state(string)`
- `self.cell_state_to_ascii(cell_state)`
- `self.next_generation_state(cell_state, neighbors_cnt)`

Testing
-------

    sudo apt install inotify-tools
    inotifywait -m -e CLOSE_WRITE ./lib ./test | xargs -n1 -I{} dart test

Tmux window startup
-------------------

Script `tmux-test.sh` for start TDD session. 4 panes: readme, test watcher, code, test code.

    #!/bin/sh
    tmux new-session -d 'vim README.md'
    tmux split-window -v 'vim lib/cell.dart'
    tmux split-window -h 'vim test/cell_test.dart'
    tmux select-pane -t 0
    tmux split-window -h 'inotifywait -m -e CLOSE_WRITE ./lib ./test | xargs -n1 -I{} dart test'
    tmux select-pane -D
    tmux new-window 'dart'
    tmux -2 attach-session -d



