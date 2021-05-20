class Cell{

  static const EMPTY = '.';
  static const LIFE  = '*';

  static String next_generation_state(String cell_state, int neighbors_cnt){
    if (cell_state == Cell.EMPTY){
      return neighbors_cnt == 3 ? Cell.LIFE : Cell.EMPTY; 
    }
  }
}
