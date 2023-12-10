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

enum EnemySpriteRow { idleRight, walkRight, attackRight, attackDown, die }

extension EnemySpriteVector on EnemySpriteRow {
  Vector2 get vector {
    switch (this) {
      case EnemySpriteRow.idleRight:
        return Vector2(0, 3 * 64);
      case EnemySpriteRow.walkRight:
        return Vector2(0, 11 * 64);
      case EnemySpriteRow.attackRight:
        return Vector2(0, 21 * 64 + 3 * 192);
      case EnemySpriteRow.attackDown:
        return Vector2(0, 21 * 64 + 2 * 192);
      case EnemySpriteRow.die:
        return Vector2(0, 20 * 64);
      default:
        throw Exception('no sprite found');
    }
  }
}

enum MageEnemySpriteRow { idleRight, walkRight, attackRight, attackDown, die }

extension MageEnemySpriteVector on MageEnemySpriteRow {
  Vector2 get vector {
    switch (this) {
      case MageEnemySpriteRow.idleRight:
        return Vector2(0, 3 * 64);
      case MageEnemySpriteRow.walkRight:
        return Vector2(0, 11 * 64);
      case MageEnemySpriteRow.attackRight:
        return Vector2(0, 21 * 64 + 3 * 192);
      case MageEnemySpriteRow.attackDown:
        return Vector2(0, 21 * 64 + 2 * 192);
      case MageEnemySpriteRow.die:
        return Vector2(0, 20 * 64);
      default:
        throw Exception('no sprite found');
    }
  }
}
