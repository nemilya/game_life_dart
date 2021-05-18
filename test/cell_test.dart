import 'package:test/test.dart';

import 'package:game_life_dart/cell.dart';

void main() {

  Cell cell;

  test('Consts', () {
    expect(Cell.EMPTY, '.');
    expect(Cell.LIFE,  '*');
  }); 
}
