class Cell{

  static const EMPTY = '.';
  static const LIFE  = '*';

  static String next_generation_state(String cell_state, int neighbors_cnt){
    if (cell_state == Cell.EMPTY){
      return neighbors_cnt == 3 ? Cell.LIFE : Cell.EMPTY; 
    }
    else if (cell_state == Cell.LIFE){
      return (neighbors_cnt == 3 || neighbors_cnt == 2) ? Cell.LIFE : Cell.EMPTY; 
    }
  }
}
