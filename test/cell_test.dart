import 'package:test/test.dart';

import 'package:game_life_dart/cell.dart';

void main() {

  test('Consts', () {
    expect(Cell.ASCII_EMPTY, '.');
    expect(Cell.ASCII_LIFE,  '*');
  }); 

  test('asciiToCellState', () {
    expect(Cell.asciiToCellState(Cell.ASCII_EMPTY), CellState.empty);
    expect(Cell.asciiToCellState(Cell.ASCII_LIFE),  CellState.life);
  });

  test('cellStateToAscii', () {
    expect(Cell.cellStateToAscii(CellState.empty), Cell.ASCII_EMPTY);
    expect(Cell.cellStateToAscii(CellState.life),  Cell.ASCII_LIFE);
  });

  test('nextGenerationState for EMPTY cell', (){
    //                                               neighborsCnt
    expect(Cell.nextGenerationState(CellState.empty, 0), CellState.empty);
    expect(Cell.nextGenerationState(CellState.empty, 1), CellState.empty);
    expect(Cell.nextGenerationState(CellState.empty, 2), CellState.empty);

    expect(Cell.nextGenerationState(CellState.empty, 3), CellState.life);

    expect(Cell.nextGenerationState(CellState.empty, 4), CellState.empty);
    expect(Cell.nextGenerationState(CellState.empty, 5), CellState.empty);
    expect(Cell.nextGenerationState(CellState.empty, 6), CellState.empty);
    expect(Cell.nextGenerationState(CellState.empty, 7), CellState.empty);
    expect(Cell.nextGenerationState(CellState.empty, 8), CellState.empty);
  });
  
  test('nextGenerationState for LIFE cell', (){
    //                                                neighborsCnt
    expect(Cell.nextGenerationState(CellState.life, 0), CellState.empty);
    expect(Cell.nextGenerationState(CellState.life, 1), CellState.empty);

    expect(Cell.nextGenerationState(CellState.life, 2), CellState.life);
    expect(Cell.nextGenerationState(CellState.life, 3), CellState.life);

    expect(Cell.nextGenerationState(CellState.life, 4), CellState.empty);
    expect(Cell.nextGenerationState(CellState.life, 5), CellState.empty);
    expect(Cell.nextGenerationState(CellState.life, 6), CellState.empty);
    expect(Cell.nextGenerationState(CellState.life, 7), CellState.empty);
    expect(Cell.nextGenerationState(CellState.life, 8), CellState.empty);
  });
}

