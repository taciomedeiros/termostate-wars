import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/shared/sprite_sheet_mapper.dart';

enum RedEnemyAnimation { attackRight, attackDown }

class RedEnemySpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "enemy/red_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: FireEnemySpriteRow.idleRight.vector,
          amount: 4,
          stepTime: 0.4,
          textureSize: Vector2.all(64),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "enemy/red_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: FireEnemySpriteRow.walkRight.vector,
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2.all(64),
        ),
      );

  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
        "enemy/red_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: FireEnemySpriteRow.attackRight.vector,
          amount: 5,
          stepTime: 0.1,
          textureSize: Vector2.all(192),
        ),
      );

  static Future<SpriteAnimation> get attackDown => SpriteAnimation.load(
        "enemy/red_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: FireEnemySpriteRow.attackDown.vector,
          amount: 5,
          stepTime: 0.1,
          textureSize: Vector2.all(192),
        ),
      );
  static Future<SpriteAnimation> get die => SpriteAnimation.load(
        "enemy/red_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: FireEnemySpriteRow.die.vector,
          amount: 5,
          stepTime: 0.1,
          textureSize: Vector2.all(64),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
          idleRight: idleRight,
          runRight: runRight,
          others: {
            RedEnemyAnimation.attackRight: attackRight,
            RedEnemyAnimation.attackDown: attackDown,
          });
}
