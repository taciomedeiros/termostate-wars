import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/fire_enemy.dart';

class MyWorld extends WorldMapByTiled {
  MyWorld(super.path)
      : super(
          forceTileSize: Vector2(16, 16),
          objectsBuilder: {
            'fire-enemy': (TiledObjectProperties properties) {
              print('identificou');
              return FireEnemy(properties.position);
            }
          },
        );

  @override
  Future<void>? onLoad() {
    return super.onLoad();
  }
}
