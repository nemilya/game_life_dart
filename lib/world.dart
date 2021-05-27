import 'package:game_life_dart/cell.dart';

class World {
  late int rowsCnt;
  late int colsCnt;
  late List<List<CellState>> cells;

  void init({required int rowsCnt, required int colsCnt}){
    cells = [];
    this.rowsCnt = rowsCnt;
    this.colsCnt = colsCnt;
    for(int r = 0; r < rowsCnt; r++){
      cells.add(List.filled(colsCnt, CellState.empty));
    }
  }
    
  CellState getCellAt(int row, int col){
    // test for out of range
    if (row > rowsCnt-1 || col > colsCnt-1 || row < 0 || col < 0) return CellState.empty;

    return cells[row][col]; 
  }

  void setCell(int row, int col, CellState cellState){
    cells[row][col] = cellState;
  }

  void parse(String asciiMap){
    List<String> rows = asciiMap.split("\n");
    int _rowsCnt = rows.length;
    int _colsCnt = rows[0].split('').length;
    init(rowsCnt: _rowsCnt, colsCnt: _colsCnt);
    var r = 0;
    for (var row in rows){
      var elements = row.split('');
      var c = 0;
      for (var asciiCellState in elements){
        var cellState = Cell.asciiToCellState(asciiCellState);
        setCell(r, c, cellState);
        c += 1;
      };
      r += 1;
    } 
  }

  int neighborsCntAt(int row, int col){
    int neighborsCnt = 0;
    for (var deltaRow in [-1, 0, 1]){
      for (var deltaCol in [-1, 0, 1]){
        if (deltaRow == 0 && deltaCol == 0){
          continue;
        };
        if (getCellAt(row+deltaRow, col+deltaCol) == CellState.life){
          neighborsCnt += 1;
        };
      }; // for deltaRow
    }; // for deltaCol
    return neighborsCnt;
  }

  String asAscii(){
    List<String> lines = [];
    for (var r = 0; r < rowsCnt; r++){
      String line = '';
      for (var c = 0; c < colsCnt; c++){
        var cellState = getCellAt(r, c);
        var asciiCellState = Cell.cellStateToAscii(cellState);
        line += asciiCellState;
      };
      lines.add(line);
    };
    return lines.join("\n");
  }
}
