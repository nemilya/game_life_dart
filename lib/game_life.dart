import 'package:game_life_dart/world.dart';
import 'package:game_life_dart/cell.dart';

class GameLife{
  late World generation;

  GameLife(){
    generation = new World();
  }

  void set_world(String ascii_map){
    generation.parse(ascii_map);
  }

  String get_world_as_ascii(){
    return generation.as_ascii();
  }

  void step(){
    World next_generation = new World();
    next_generation.init(rows: generation.rowsCnt(), cols: generation.colsCnt());
    for (var r = 0; r < generation.rowsCnt(); r++){
      for (var c = 0; c < generation.colsCnt(); c++){
        var cur_cell_state = generation.get_cell_at(r, c);
        var n_cnt = generation.neighbors_cnt_at(r, c);
        var next_cell_state = Cell.next_generation_state(cur_cell_state, n_cnt);
        next_generation.set_cell(r, c, next_cell_state);
      }
    }
    generation = next_generation;
  }
}
