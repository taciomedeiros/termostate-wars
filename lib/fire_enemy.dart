import 'package:bonfire/bonfire.dart';
import 'package:bonfire/npc/enemy/simple_enemy.dart';
import 'package:thermostate_wars/animations/fire_enemy_sprite_sheet.dart';

class FireEnemy extends SimpleEnemy {
  FireEnemy(Vector2 position)
      : super(
          position: position, //required
          size: Vector2(32.0, 32.0), //required
          life: 100,
          speed: 100,
          initDirection: Direction.right,
          animation: FireEnemySpriteSheet.simpleDirectionAnimation,
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
