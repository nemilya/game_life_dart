import 'package:game_life_dart/world.dart';
import 'package:game_life_dart/cell.dart';

class GameLife{
  late World generation;

  GameLife(){
    generation = new World();
  }

  void setWorld(String asciiMap){
    generation.parse(asciiMap);
  }

  String getWorldAsAscii(){
    return generation.asAscii();
  }

  // generate next generation
  void step(){
    World nextGeneration = new World();
    nextGeneration.init(rowsCnt: generation.rowsCnt, colsCnt: generation.colsCnt);
    for (var r = 0; r < generation.rowsCnt; r++){
      for (var c = 0; c < generation.colsCnt; c++){
        var curCellState  = generation.getCellAt(r, c);
        var neighborsCnt  = generation.neighborsCntAt(r, c);
        var nextCellState = Cell.nextGenerationState(curCellState, neighborsCnt);
        nextGeneration.setCell(r, c, nextCellState);
      }
    }
    generation = nextGeneration;
  }
}
