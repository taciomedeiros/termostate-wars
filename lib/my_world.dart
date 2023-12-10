import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/enemies/red_boss_enemy.dart';
import 'package:thermostate_wars/wall.dart';
import 'package:flame_audio/flame_audio.dart';

class MyWorld extends WorldMapByTiled {
  late Vector2 worldCenter;

  MyWorld(super.path)
      : super(forceTileSize: Vector2(16, 16), objectsBuilder: {
          'wall': (TiledObjectProperties properties) =>
              Wall(position: properties.position, size: properties.size),
        });

  @override
  Future<void>? onLoad() {
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('background_music.mp3');

    worldCenter = Vector2(mapSize.x / 2, mapSize.x / 2);

    //gameRef.add(MageNpc(initialMagePosition));
    gameRef.add(
        RedBossEnemy(initialBossPosition, notifyDeath: (SimpleEnemy enemy) {}));

    return super.onLoad();
  }
}
