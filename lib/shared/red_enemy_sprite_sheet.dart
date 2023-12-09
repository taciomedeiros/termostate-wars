import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/shared/sprite_sheet_mapper.dart';

class RedEnemySpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "enemy/red-enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: FireEnemySpriteRow.idleRight.vector,
          amount: 4,
          stepTime: 0.4,
          textureSize: Vector2.all(64),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "enemy/red-enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: FireEnemySpriteRow.walkRight.vector,
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2.all(64),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idleRight,
        runRight: runRight,
      );
}
