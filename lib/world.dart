import 'package:game_life_dart/cell.dart';

class World {
  int rows_cnt;
  int cols_cnt;
  List<List<String>> cells;

  void init({int rows, int cols}){
    cells = [];
    rows_cnt = rows;
    cols_cnt = cols;
    for(int row = 0; row < rows; row++){
      cells.add(List.filled(cols, Cell.EMPTY));
    }
  }
    
  int rowsCnt() => rows_cnt;
  int colsCnt() => cols_cnt;

  String get_cell_at(int row, int col){
    // test for out of range
    if (row > rows_cnt-1 || col > cols_cnt-1) return Cell.EMPTY;

    return cells[row][col]; 
  }

  void set_cell(int row, int col, String cell_state){
    cells[row][col] = cell_state;
  }

  void parse(String ascii_map){
   var rows = ascii_map.split("\n");
   var _rows_cnt = rows.length;
   var _cols_cnt = rows[0].split('').length;
   init(rows: _rows_cnt, cols: _cols_cnt);
   var r = 0;
   for (var row in rows){
     var elements = row.split('');
     var c = 0;
     for (var cell_state in elements){
       set_cell(r, c, cell_state);
       c += 1;
     };
     r += 1;
   } 
  }
}
