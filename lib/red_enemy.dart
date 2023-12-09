import 'package:bonfire/bonfire.dart';
import 'package:bonfire/npc/enemy/simple_enemy.dart';
import 'package:thermostate_wars/shared/fire_enemy_sprite_sheet.dart';

class RedEnemy extends SimpleEnemy {
  RedEnemy(Vector2 position)
      : super(
          position: position, //required
          size: Vector2.all(20.0), //required
          life: 100,
          speed: 1,
          initDirection: Direction.right,
          animation: RedEnemySpriteSheet.simpleDirectionAnimation,
        );

  @override
  void update(double dt) {
    // do anything
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    // do anything
    super.render(canvas);
  }
}
