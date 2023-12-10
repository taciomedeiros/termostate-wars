import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/npcs/mage_npc.dart';
import 'package:thermostate_wars/wall.dart';

class MyWorld extends WorldMapByTiled {
  late Vector2 worldCenter;

  MyWorld(super.path)
      : super(forceTileSize: Vector2(16, 16), objectsBuilder: {
          'wall': (TiledObjectProperties properties) =>
              Wall(position: properties.position, size: properties.size),
        });

  @override
  Future<void>? onLoad() {
    worldCenter = Vector2(mapSize.x / 2, mapSize.x / 2);

    gameRef.add(MageNpc(initialMagePosition));

    return super.onLoad();
  }
}
