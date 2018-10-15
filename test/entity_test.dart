import 'package:test/test.dart';

import 'package:game_life_dart/entity.dart';

void main() {

  Entity entity;

  setUp((){
    var position = { 'r': 1, 'c': 2};
    entity = new Entity(position, '.');
  });

  test('Exists', () {
    expect(entity is Entity, true);
  });

  test('Init position', () {
    expect(entity.position['r'], 1);
  });
}