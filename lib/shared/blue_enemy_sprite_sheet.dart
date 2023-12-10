import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/shared/sprite_sheet_mapper.dart';

enum BlueEnemyAnimation { attackRight, attackDown, die }

class BlueEnemySpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "enemy/blue_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: EnemySpriteRow.idleRight.vector,
          amount: 4,
          stepTime: 0.4,
          textureSize: Vector2.all(64),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "enemy/blue_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: EnemySpriteRow.walkRight.vector,
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2.all(64),
        ),
      );

  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
        "enemy/blue_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: EnemySpriteRow.attackRight.vector,
          amount: 5,
          stepTime: 0.1,
          textureSize: Vector2.all(192),
        ),
      );

  static Future<SpriteAnimation> get attackDown => SpriteAnimation.load(
        "enemy/blue_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: EnemySpriteRow.attackDown.vector,
          amount: 5,
          stepTime: 0.1,
          textureSize: Vector2.all(192),
        ),
      );
  static Future<SpriteAnimation> get die => SpriteAnimation.load(
        "enemy/blue_enemy.png",
        SpriteAnimationData.sequenced(
          texturePosition: EnemySpriteRow.attackDown.vector,
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
            BlueEnemyAnimation.attackRight: attackRight,
            BlueEnemyAnimation.attackDown: attackDown,
            BlueEnemyAnimation.die: die,
          });
}
