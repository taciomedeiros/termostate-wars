import 'package:bonfire/bonfire.dart';
import 'sprite_sheet_mapper.dart';

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "player/player_rapier.png",
        SpriteAnimationData.sequenced(
            texturePosition: PlayerSpriteRow.dancingRight.vector,
            amount: 3,
            stepTime: 0.4,
            textureSize: Vector2(64, 64)),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "player/player_rapier.png",
        SpriteAnimationData.sequenced(
          texturePosition: PlayerSpriteRow.walkRight.vector,
          amount: 9,
          stepTime: 0.1,
          textureSize: Vector2(64, 64),
        ),
      );

  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
        "player/player_rapier.png",
        SpriteAnimationData.sequenced(
          texturePosition: PlayerSpriteRow.attackUp.vector,
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2.all(192),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
          idleRight: idleRight,
          runRight: runRight,
          others: {
            "attackRight": attackRight,
          });
}
