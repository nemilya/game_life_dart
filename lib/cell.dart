class Cell{

  static const EMPTY = '.';
  static const LIFE  = '*';

  static String next_generation_state(String cell_state, int neighbors_cnt){
    switch(cell_state){

      case Cell.EMPTY:
        return
          neighbors_cnt == 3 ? 
            Cell.LIFE : Cell.EMPTY;
 
      case Cell.LIFE:
        return 
          (neighbors_cnt == 3 || neighbors_cnt == 2) ? 
            Cell.LIFE : Cell.EMPTY; 
    }
  }
}
