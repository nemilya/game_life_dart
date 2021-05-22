import 'package:test/test.dart';

import 'package:game_life_dart/world.dart';
import 'package:game_life_dart/cell.dart';

void main() {

  World world;

  setUp((){
    world = new World();
    world.init(rows: 3, cols: 4);
  });

  test('rowsCnt, colsCnt', () {
    expect(world.rowsCnt(), 3);
    expect(world.colsCnt(), 4);
  });

  test('get_cell_at', () {
    expect(world.get_cell_at(0, 0), Cell.EMPTY);
    // out range
    expect(world.get_cell_at(3, 0), Cell.EMPTY);
    expect(world.get_cell_at(0, 4), Cell.EMPTY);
  });

  test('set_cell', () {
    world.set_cell(0, 0, Cell.LIFE);
    expect(world.get_cell_at(0, 0), Cell.LIFE);
  });

  test('parse', () {
    var ascii_map = "...\n"
                    "...\n"
                    "...\n"
                    "*..";
    world.parse(ascii_map);
    expect(world.rowsCnt(), 4);
    expect(world.colsCnt(), 3);
    expect(world.get_cell_at(0, 0), Cell.EMPTY);
    expect(world.get_cell_at(3, 0), Cell.LIFE);
  });
}
