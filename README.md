Game Life by Dart
=================

OOA/OOP, TDD.

Conway's Game of Life

- Any live cell with two or three live neighbours survives.
- Any dead cell with three live neighbours becomes a live cell.
- All other live cells die in the next generation. Similarly, all other dead cells stay dead.

Game
----

- `setWorld(asciiMap)`
- `step()`
- `getWorldAsAcsii()` 

World
-----

- `init(rows, cols)`
- `rowsCnt, colsCnt`
- `getCellAt(row, col)` 
- `setCell(row, col, cellState)`
- `parse(asciiMap)`
- `neighborsCntAt(row, col)`
- `asAscii()`

Cell
----

- `enum CellState`
- `self.asciiToCellState(string)`
- `self.cellStateToAscii(cellState)`
- `self.nextGenerationState(cellState, neighborsCnt)`

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
    tmux split-window -h 'inotifywait -m -e CLOSE_WRITE ./lib ./test | xargs -n1 -I{} dart test test/cell_test.dart'
    tmux select-pane -D
    tmux new-window 'dart'
    tmux -2 attach-session -d



