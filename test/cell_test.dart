import 'package:test/test.dart';

import 'package:game_life_dart/cell.dart';

void main() {

  test('Consts', () {
    expect(Cell.EMPTY, '.');
    expect(Cell.LIFE,  '*');
  }); 

  test('next_generation_state for EMPTY cell', (){
    //                                            neighbors_cnt
    expect(Cell.next_generation_state(Cell.EMPTY, 0), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.EMPTY, 1), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.EMPTY, 2), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.EMPTY, 3), Cell.LIFE);
    expect(Cell.next_generation_state(Cell.EMPTY, 4), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.EMPTY, 5), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.EMPTY, 6), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.EMPTY, 7), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.EMPTY, 8), Cell.EMPTY);
  });
  
  test('next_generation_state for LIFE cell', (){
    //                                           neighbors_cnt
    expect(Cell.next_generation_state(Cell.LIFE, 0), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.LIFE, 1), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.LIFE, 2), Cell.LIFE);
    expect(Cell.next_generation_state(Cell.LIFE, 3), Cell.LIFE);
    expect(Cell.next_generation_state(Cell.LIFE, 4), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.LIFE, 5), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.LIFE, 6), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.LIFE, 7), Cell.EMPTY);
    expect(Cell.next_generation_state(Cell.LIFE, 8), Cell.EMPTY);
  });
}

