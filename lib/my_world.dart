import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/fire_enemy.dart';

class MyWorld extends WorldMapByTiled {
  MyWorld(super.path)
      : super(
          forceTileSize: Vector2(16, 16),
          objectsBuilder: {
            'fireEnemy': (TiledObjectProperties properties) =>
                FireEnemy(properties.position),
          },
        );

  @override
  Future<void>? onLoad() {
    gameRef.add(FireEnemy(Vector2.all(100)));
    return super.onLoad();
  }
}
