import 'package:bonfire/bonfire.dart';

enum PlayerSpriteRow {
  walkLeft,
  dancingRight,
  walkRight,
  attackRight,
  attackUp;
}

extension PlayerSpriteVector on PlayerSpriteRow {
  Vector2 get vector {
    switch (this) {
      case PlayerSpriteRow.walkRight:
        return Vector2(0 * 64, 11 * 64);
      case PlayerSpriteRow.dancingRight:
        return Vector2(0 * 64, 3 * 64);
      case PlayerSpriteRow.attackUp:
        return Vector2(0 * 64, 21 * 64);
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
