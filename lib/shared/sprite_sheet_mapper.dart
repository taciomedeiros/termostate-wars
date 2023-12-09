import 'package:bonfire/bonfire.dart';

enum PlayerSpriteRow {
  dancingRight,
  walkRight,
  attackRight,
  attackUp,
  attackDown,
  die;
}

extension PlayerSpriteVector on PlayerSpriteRow {
  Vector2 get vector {
    switch (this) {
      case PlayerSpriteRow.walkRight:
        return Vector2(0 * 64, 11 * 64);
      case PlayerSpriteRow.dancingRight:
        return Vector2(0 * 64, 3 * 64);
      case PlayerSpriteRow.die:
        return Vector2(0 * 64, 20 * 64);
      case PlayerSpriteRow.attackUp:
        return Vector2(0, 21 * 64 + 0 * 192);
      case PlayerSpriteRow.attackRight:
        return Vector2(0, 21 * 64 + 3 * 192);
      case PlayerSpriteRow.attackDown:
        return Vector2(0, 21 * 64 + 2 * 192);
      default:
        throw Exception('no sprite found');
    }
  }
}

enum FireEnemySpriteRow { idleRight, walkRight, attackRight, attackDown, die }

extension FireSpriteVector on FireEnemySpriteRow {
  Vector2 get vector {
    switch (this) {
      case FireEnemySpriteRow.idleRight:
        return Vector2(0, 3 * 64);
      case FireEnemySpriteRow.walkRight:
        return Vector2(0, 11 * 64);
      case FireEnemySpriteRow.attackRight:
        return Vector2(0, 21 * 64 + 3 * 192);
      case FireEnemySpriteRow.attackDown:
        return Vector2(0, 21 * 64 + 2 * 192);
      case FireEnemySpriteRow.die:
        return Vector2(0, 20 * 64);
      default:
        throw Exception('no sprite found');
    }
  }
}
