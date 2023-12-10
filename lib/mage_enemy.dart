import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/shared/mage_enemy_sprite_sheet.dart';

class MageEnemy extends SimpleEnemy {
  MageEnemy(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(16),
          initDirection: Direction.left,
          animation: MageEnemySpriteSheet.simpleDirectionAnimation,
        );
}
