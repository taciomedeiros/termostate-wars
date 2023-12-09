import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet {
  // static Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
  //       "player/player_no_weapon.png",
  //       SpriteAnimationData.sequenced(
  //         texturePosition: Vector2(64, 64),
  //         amount: 1,
  //         stepTime: 0.0,
  //         textureSize: Vector2(64, 64),
  //       ),
  //     );

  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        "player/player_no_weapon.png",
        SpriteAnimationData.sequenced(
          texturePosition: Vector2(0 * 64, 3 * 64),
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(64, 64),
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        "player/player_no_weapon.png",
        SpriteAnimationData.sequenced(
          texturePosition: Vector2(0 * 64, 11 * 64),
          amount: 9,
          stepTime: 0.1,
          textureSize: Vector2(64, 64),
        ),
      );

  // static Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
  //       "player_no_weapon.png",
  //       SpriteAnimationData.sequenced(
  //         amount: 1,
  //         stepTime: 0.1,
  //         textureSize: Vector2(64, 64),
  //       ),
  //     );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idleRight,
        runRight: runRight,
      );
}
