import 'package:game_life_dart/cell.dart';

class World {
  late int rows_cnt;
  late int cols_cnt;
  late List<List<String>> cells;

  void init({required int rows, required int cols}){
    cells = [];
    rows_cnt = rows;
    cols_cnt = cols;
    for(int r = 0; r < rows_cnt; r++){
      cells.add(List.filled(cols_cnt, Cell.EMPTY));
    }
  }
    
  int rowsCnt() => rows_cnt;
  int colsCnt() => cols_cnt;

  String get_cell_at(int row, int col){
    // test for out of range
    if (row > rows_cnt-1 || col > cols_cnt-1 || row < 0 || col < 0) return Cell.EMPTY;

    return cells[row][col]; 
  }

  void set_cell(int row, int col, String cell_state){
    cells[row][col] = cell_state;
  }

  void parse(String ascii_map){
    List<String> rows = ascii_map.split("\n");
    int _rows_cnt = rows.length;
    int _cols_cnt = rows[0].split('').length;
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

  int neighbors_cnt_at(int row, int col){
    int n_cnt = 0;
    for (var delta_r in [-1, 0, 1]){
      for (var delta_c in [-1, 0, 1]){
        if (delta_r == 0 && delta_c == 0){
          continue;
        };
        if (get_cell_at(row+delta_r, col+delta_c) == Cell.LIFE){
          n_cnt += 1;
        };
      }; // for delta_c
    }; // for delta_r
    return n_cnt;
  }

  String as_ascii(){
    List<String> lines = [];
    for (var r = 0; r < rows_cnt; r++){
      String line = '';
      for (var c = 0; c < cols_cnt; c++){
        line += get_cell_at(r, c);
      };
      lines.add(line);
    };
    return lines.join("\n");
  }
}
