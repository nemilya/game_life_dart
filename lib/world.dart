import 'package:game_life_dart/cell.dart';

class World {
  late int rows_cnt;
  late int cols_cnt;
  late List<List<CellState>> cells;

  void init({required int rows, required int cols}){
    cells = [];
    rows_cnt = rows;
    cols_cnt = cols;
    for(int r = 0; r < rows_cnt; r++){
      cells.add(List.filled(cols_cnt, CellState.empty));
    }
  }
    
  int rowsCnt() => rows_cnt;
  int colsCnt() => cols_cnt;

  CellState get_cell_at(int row, int col){
    // test for out of range
    if (row > rows_cnt-1 || col > cols_cnt-1 || row < 0 || col < 0) return CellState.empty;

    return cells[row][col]; 
  }

  void set_cell(int row, int col, CellState cell_state){
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
      for (var ascii_cell_state in elements){
        var cell_state = Cell.ascii_to_cell_state(ascii_cell_state);
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
        if (get_cell_at(row+delta_r, col+delta_c) == CellState.life){
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
        var cell_state = get_cell_at(r, c);
        var ascii_cell_state = Cell.cell_state_to_ascii(cell_state);
        line += ascii_cell_state;
      };
      lines.add(line);
    };
    return lines.join("\n");
  }
}
