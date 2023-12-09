import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/shared/sprite_sheet_mapper.dart';

class RedEnemySpriteSheet {
  static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        "enemy/red-enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: FireEnemySpriteRow.walkRight.vector,
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2.all(64),
        ),
      );

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "enemy/red-enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: FireEnemySpriteRow.walkRight.vector,
          amount: 4,
          stepTime: 0.2,
          textureSize: Vector2.all(64),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "enemy/red-enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: FireEnemySpriteRow.walkRight.vector,
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2.all(64),
        ),
      );

  static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        "enemy/red-enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: FireEnemySpriteRow.walkRight.vector,
          amount: 6,
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
