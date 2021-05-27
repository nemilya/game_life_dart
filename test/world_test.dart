import 'package:test/test.dart';

import 'package:game_life_dart/world.dart';
import 'package:game_life_dart/cell.dart';

void main() {

  late World world;

  setUp((){
    world = new World();
    world.init(rowsCnt: 3, colsCnt: 4);
  });

  test('rowsCnt, colsCnt', () {
    expect(world.rowsCnt, 3);
    expect(world.colsCnt, 4);
  });

  test('getCellAt', () {
    expect(world.getCellAt(0, 0), CellState.empty);
    // out of range
    expect(world.getCellAt( 3,  0), CellState.empty);
    expect(world.getCellAt( 0,  4), CellState.empty);
    expect(world.getCellAt(-1,  0), CellState.empty);
    expect(world.getCellAt( 1, -1), CellState.empty);
 
  });

  test('setCell', () {
    world.setCell(0, 0, CellState.life);
    expect(world.getCellAt(0, 0), CellState.life);
  });

  test('parse', () {
    var asciiMap = "..." "\n"
                   "..." "\n"
                   "..." "\n"
                   "*..";
    world.parse(asciiMap);
    expect(world.rowsCnt, 4);
    expect(world.colsCnt, 3);
    expect(world.getCellAt(0, 0), CellState.empty);
    expect(world.getCellAt(3, 0), CellState.life);
  });

  test('neighborsCntAt', () {
    var asciiMap = "..*\n"
                   "..*\n"
                   "***";
    world.parse(asciiMap);
    expect(world.neighborsCntAt(0, 0), 0);
    expect(world.neighborsCntAt(0, 1), 2);
    expect(world.neighborsCntAt(1, 1), 5);
    expect(world.neighborsCntAt(2, 2), 2);
  });

  test('asAscii', () {
    var asciiMap = "..*\n"
                   "..*\n"
                   "***";
    world.parse(asciiMap);
    expect(world.asAscii(), asciiMap);
  });
}
