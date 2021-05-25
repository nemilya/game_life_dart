enum CellState { life, empty }

class Cell{

  static const ASCII_EMPTY = '.';
  static const ASCII_LIFE  = '*';

  static CellState ascii_to_cell_state(String ascii_cell_state){
    switch(ascii_cell_state){
      case ASCII_EMPTY:
        return CellState.empty;
      case ASCII_LIFE:
        return CellState.life;
      default:
        return CellState.empty;
    }
  }

  static String cell_state_to_ascii(CellState cell_state){
    switch(cell_state){
      case CellState.empty:
        return ASCII_EMPTY; 
      case CellState.life:
        return ASCII_LIFE;
      default:
        return ASCII_EMPTY;
    }
  }

  static CellState next_generation_state(CellState cell_state, int neighbors_cnt){
    switch(cell_state){

      case CellState.empty:
        return
          neighbors_cnt == 3 ? 
            CellState.life : CellState.empty;
 
      case CellState.life:
        return 
          (neighbors_cnt == 3 || neighbors_cnt == 2) ? 
            CellState.life : CellState.empty; 
    }
  }
}
