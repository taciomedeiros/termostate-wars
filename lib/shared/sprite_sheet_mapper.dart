import 'package:bonfire/bonfire.dart';

enum PlayerSpriteRow {
  walkLeft;
}

extension PlayerSpriteVector on PlayerSpriteRow {
  Vector2 get vector {
    switch (this) {
      case PlayerSpriteRow.walkLeft:
        return Vector2(0 * 64, 11 * 64);
      default:
        throw Exception('no sprite found');
    }
  }
}

enum FireEnemySpriteRow {
  walkRight;
}

extension FireSpriteVector on FireEnemySpriteRow {
  Vector2 get vector {
    switch (this) {
      case FireEnemySpriteRow.walkRight:
        return Vector2(0, 3 * 64);
      default:
        throw Exception('no sprite found');
    }
  }
}
