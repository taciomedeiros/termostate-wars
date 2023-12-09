import 'package:bonfire/bonfire.dart';

enum SpriteRow {
  walkLeft;
}

extension SpriteVector on SpriteRow {
  Vector2 get vector {
    switch (this) {
      case SpriteRow.walkLeft:
        return Vector2(0 * 64, 11 * 64);
      default:
        throw Exception('no sprite found');
    }
  }
}
