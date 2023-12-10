import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/enemy_creator.dart';
import 'package:thermostate_wars/mage_enemy.dart';
import 'package:thermostate_wars/wall.dart';

class MyWorld extends WorldMapByTiled {
  late Vector2 worldCenter;
  EnemyCreator enemyCreator = EnemyCreator(mapSize * tileSize);

  Map<String, int> killedEnemies = {"blue": 0, "red": 0};

  MyWorld(super.path)
      : super(forceTileSize: Vector2(16, 16), objectsBuilder: {
          'wall': (TiledObjectProperties properties) =>
              Wall(position: properties.position, size: properties.size),
        });

  @override
  Future<void>? onLoad() {
    worldCenter = Vector2(mapSize.x / 2, mapSize.x / 2);

    gameRef.add(MageEnemy(initialMagePosition));
    //gameRef.add(enemyCreator);

    return super.onLoad();
  }
}
