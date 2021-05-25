import 'package:test/test.dart';

import 'package:game_life_dart/cell.dart';

void main() {

  test('Consts', () {
    expect(Cell.ASCII_EMPTY, '.');
    expect(Cell.ASCII_LIFE,  '*');
  }); 

  test('ascii_to_cell_state', () {
    expect(Cell.ascii_to_cell_state(Cell.ASCII_EMPTY), CellState.empty);
    expect(Cell.ascii_to_cell_state(Cell.ASCII_LIFE),  CellState.life);
  });

  test('cell_state_to_ascii', () {
    expect(Cell.cell_state_to_ascii(CellState.empty), Cell.ASCII_EMPTY);
    expect(Cell.cell_state_to_ascii(CellState.life),  Cell.ASCII_LIFE);
  });

  test('next_generation_state for EMPTY cell', (){
    //                                                 neighbors_cnt
    expect(Cell.next_generation_state(CellState.empty, 0), CellState.empty);
    expect(Cell.next_generation_state(CellState.empty, 1), CellState.empty);
    expect(Cell.next_generation_state(CellState.empty, 2), CellState.empty);

    expect(Cell.next_generation_state(CellState.empty, 3), CellState.life);

    expect(Cell.next_generation_state(CellState.empty, 4), CellState.empty);
    expect(Cell.next_generation_state(CellState.empty, 5), CellState.empty);
    expect(Cell.next_generation_state(CellState.empty, 6), CellState.empty);
    expect(Cell.next_generation_state(CellState.empty, 7), CellState.empty);
    expect(Cell.next_generation_state(CellState.empty, 8), CellState.empty);
  });
  
  test('next_generation_state for LIFE cell', (){
    //                                                neighbors_cnt
    expect(Cell.next_generation_state(CellState.life, 0), CellState.empty);
    expect(Cell.next_generation_state(CellState.life, 1), CellState.empty);

    expect(Cell.next_generation_state(CellState.life, 2), CellState.life);
    expect(Cell.next_generation_state(CellState.life, 3), CellState.life);

    expect(Cell.next_generation_state(CellState.life, 4), CellState.empty);
    expect(Cell.next_generation_state(CellState.life, 5), CellState.empty);
    expect(Cell.next_generation_state(CellState.life, 6), CellState.empty);
    expect(Cell.next_generation_state(CellState.life, 7), CellState.empty);
    expect(Cell.next_generation_state(CellState.life, 8), CellState.empty);
  });
}

