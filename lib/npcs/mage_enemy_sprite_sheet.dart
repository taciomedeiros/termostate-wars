import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/shared/sprite_sheet_mapper.dart';

enum MageEnemyAnimation { attackRight, attackDown }

class MageEnemySpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "enemy/mage_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: EnemySpriteRow.idleRight.vector,
          amount: 6,
          stepTime: 0.4,
          textureSize: Vector2.all(64),
        ),
      );

  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
        "enemy/mage_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: EnemySpriteRow.idleDown.vector,
          amount: 6,
          stepTime: 0.4,
          textureSize: Vector2.all(64),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "enemy/mage_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: EnemySpriteRow.walkRight.vector,
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2.all(64),
        ),
      );

  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
        "enemy/mage_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: EnemySpriteRow.attackRight.vector,
          amount: 5,
          stepTime: 0.1,
          textureSize: Vector2.all(192),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idleRight,
        runRight: runRight,
        others: {},
      );
}
