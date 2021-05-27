import 'package:test/test.dart';

import 'package:game_life_dart/game_life.dart';

void main() {

  test('step', () {
    var asciiMap = ".*." "\n"
                   ".*." "\n"
                   ".*.";
    
    var asciiMapNext = "..." "\n"
                       "***" "\n"
                       "...";

    GameLife gameLife = new GameLife();
    gameLife.setWorld(asciiMap);
    gameLife.step();
    expect(gameLife.getWorldAsAscii(), asciiMapNext);
  });

}
