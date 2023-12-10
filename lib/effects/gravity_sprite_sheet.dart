import 'package:bonfire/bonfire.dart';

class GravitySpriteSheet {
  static Future<SpriteAnimation> get sequence => SpriteAnimation.load(
        "effects/Gravity-SpriteSheet.png",
        SpriteAnimationData.range(
          start: 0,
          end: 19,
          amount: 20,
          stepTimes: List<double>.generate(20, (index) => 0.1),
          textureSize: Vector2(96, 80),
          amountPerRow: 4,
        ),
      );
}
