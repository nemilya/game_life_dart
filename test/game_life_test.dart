import 'package:test/test.dart';

import 'package:game_life_dart/game_life.dart';

void main() {

  GameLife game_life;

  setUp((){
    game_life = new GameLife();
  });

  test('step', () {
    var ascii_map = ".*.\n"
                    ".*.\n"
                    ".*.";
    
    var ascii_map_next = "...\n"
                         "***\n"
                         "...";

    game_life.set_world(ascii_map);
    game_life.step();
    expect(game_life.get_world_as_ascii(), ascii_map_next);
  });

}
