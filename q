enum CellState { life, empty }

class Cell{

  static const ASCII_EMPTY = '.';
  static const ASCII_LIFE  = '*';

  static CellState asciiToCellState(String asciiCellState){
    switch(asciiCellState){
      case ASCII_EMPTY:
        return CellState.empty;
      case ASCII_LIFE:
        return CellState.life;
      default:
        return CellState.empty;
    }
  }

  static String cellStateToAscii(CellState cellState){
    switch(cellState){
      case CellState.empty:
        return ASCII_EMPTY; 
      case CellState.life:
        return ASCII_LIFE;
      default:
        return ASCII_EMPTY;
    }
  }

  static CellState nextGenerationState(CellState cellState, int neighborsCnt){
    switch(cellState){

      case CellState.empty:
        return
          neighborsCnt == 3 ? 
            CellState.life : CellState.empty;
 
      case CellState.life:
        return 
          (neighborsCnt == 3 || neighborsCnt == 2) ? 
            CellState.life : CellState.empty; 
    }
  }
}
