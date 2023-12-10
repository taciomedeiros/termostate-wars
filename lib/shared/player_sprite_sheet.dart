import 'package:bonfire/bonfire.dart';
import 'sprite_sheet_mapper.dart';

const double attackAnimationStepTime = 0.05;

enum PlayerAnimation { attackRight, attackDown, attackUp, die }

class PlayerSpriteSheet {
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "player/player_rapier.png",
        SpriteAnimationData.sequenced(
            texturePosition: PlayerSpriteRow.dancingRight.vector,
            amount: 3,
            stepTime: 0.4,
            textureSize: Vector2(64, 64)),
      );
  static Future<SpriteAnimation> get idleUp => SpriteAnimation.load(
        "player/player_rapier.png",
        SpriteAnimationData.sequenced(
            texturePosition: PlayerSpriteRow.dancingUp.vector,
            amount: 3,
            stepTime: 0.4,
            textureSize: Vector2(64, 64)),
      );
  static Future<SpriteAnimation> get idleDown => SpriteAnimation.load(
        "player/player_rapier.png",
        SpriteAnimationData.sequenced(
            texturePosition: PlayerSpriteRow.dancingDown.vector,
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
  static Future<SpriteAnimation> get runUp => SpriteAnimation.load(
        "player/player_rapier.png",
        SpriteAnimationData.sequenced(
            texturePosition: PlayerSpriteRow.walkUp.vector,
            amount: 9,
            stepTime: 0.1,
            textureSize: Vector2(64, 64)),
      );
  static Future<SpriteAnimation> get runDown => SpriteAnimation.load(
        "player/player_rapier.png",
        SpriteAnimationData.sequenced(
            texturePosition: PlayerSpriteRow.walkDown.vector,
            amount: 9,
            stepTime: 0.1,
            textureSize: Vector2(64, 64)),
      );

  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
        "player/player_rapier.png",
        SpriteAnimationData.sequenced(
          texturePosition: PlayerSpriteRow.attackRight.vector,
          amount: 6,
          stepTime: attackAnimationStepTime,
          textureSize: Vector2.all(192),
        ),
      );
  static Future<SpriteAnimation> get attackDown => SpriteAnimation.load(
        "player/player_rapier.png",
        SpriteAnimationData.sequenced(
          texturePosition: PlayerSpriteRow.attackDown.vector,
          amount: 6,
          stepTime: attackAnimationStepTime,
          textureSize: Vector2.all(192),
        ),
      );
  static Future<SpriteAnimation> get attackUp => SpriteAnimation.load(
        "player/player_rapier.png",
        SpriteAnimationData.sequenced(
          texturePosition: PlayerSpriteRow.attackUp.vector,
          amount: 6,
          stepTime: attackAnimationStepTime,
          textureSize: Vector2.all(192),
        ),
      );
  static Future<SpriteAnimation> get die => SpriteAnimation.load(
        "player/player_rapier.png",
        SpriteAnimationData.sequenced(
          texturePosition: PlayerSpriteRow.die.vector,
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2.all(64),
        ),
      );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
          idleRight: idleRight,
          idleUp: idleUp,
          idleDown: idleDown,
          runRight: runRight,
          runUp: runUp,
          runDown: runDown,
          others: {
            PlayerAnimation.attackRight: attackRight,
            PlayerAnimation.attackDown: attackDown,
            PlayerAnimation.attackUp: attackUp,
            PlayerAnimation.die: die,
          });
}
