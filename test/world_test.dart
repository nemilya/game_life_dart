import 'package:test/test.dart';

import 'package:game_life_dart/world.dart';
import 'package:game_life_dart/cell.dart';

void main() {

  late World world;

  setUp((){
    world = new World();
    world.init(rows: 3, cols: 4);
  });

  test('rowsCnt, colsCnt', () {
    expect(world.rowsCnt(), 3);
    expect(world.colsCnt(), 4);
  });

  test('get_cell_at', () {
    expect(world.get_cell_at(0, 0), CellState.empty);
    // out of range
    expect(world.get_cell_at( 3,  0), CellState.empty);
    expect(world.get_cell_at( 0,  4), CellState.empty);
    expect(world.get_cell_at(-1,  0), CellState.empty);
    expect(world.get_cell_at( 1, -1), CellState.empty);
 
  });

  test('set_cell', () {
    world.set_cell(0, 0, CellState.life);
    expect(world.get_cell_at(0, 0), CellState.life);
  });

  test('parse', () {
    var ascii_map = "...\n"
                    "...\n"
                    "...\n"
                    "*..";
    world.parse(ascii_map);
    expect(world.rowsCnt(), 4);
    expect(world.colsCnt(), 3);
    expect(world.get_cell_at(0, 0), CellState.empty);
    expect(world.get_cell_at(3, 0), CellState.life);
  });

  test('neighbors_cnt_at', () {
    var ascii_map = "..*\n"
                    "..*\n"
                    "***";
    world.parse(ascii_map);
    expect(world.neighbors_cnt_at(0, 0), 0);
    expect(world.neighbors_cnt_at(0, 1), 2);
    expect(world.neighbors_cnt_at(1, 1), 5);
    expect(world.neighbors_cnt_at(2, 2), 2);
  });

  test('as_ascii', () {
    var ascii_map = "..*\n"
                    "..*\n"
                    "***";
    world.parse(ascii_map);
    expect(world.as_ascii(), ascii_map);
  });
}
