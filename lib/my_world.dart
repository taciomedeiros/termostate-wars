import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/red_enemy.dart';
import 'package:thermostate_wars/wall.dart';

class MyWorld extends WorldMapByTiled {
  MyWorld(super.path)
      : super(
          forceTileSize: Vector2(16, 16),
          objectsBuilder: {
            'fire-enemy': (TiledObjectProperties properties) =>
                RedEnemy(properties.position),
            'wall': (TiledObjectProperties properties) =>
                Wall(position: properties.position, size: properties.size),
          },
        );

  @override
  Future<void>? onLoad() {
    return super.onLoad();
  }
}
