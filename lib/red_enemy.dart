import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/shared/red_enemy_sprite_sheet.dart';

class RedEnemy extends SimpleEnemy {
  bool _seePlayerClose = false;
  double attack;
  RedEnemy(Vector2 position, this.attack)
      : super(
          position: position, //required
          size: Vector2.all(20.0), //required
          life: 100,
          speed: 5,
          initDirection: Direction.right,
          animation: RedEnemySpriteSheet.simpleDirectionAnimation,
        );

  @override
  void update(double dt) {
    _seePlayerClose = false;
    seePlayer(
      observed: (player) {
        _seePlayerClose = true;
        seeAndMoveToPlayer(
          closePlayer: (player) {
            execAttack();
          },
          radiusVision: tileSize * 20,
        );
      },
      radiusVision: tileSize * 20,
    );
    if (!_seePlayerClose) {
      seeAndMoveToAttackRange(
        positioned: (p) {},
        radiusVision: 0,
      );
    }
    super.update(dt);
  }

  void execAttack() {
    /*simpleAttackMelee(
      size: Vector2.all(tileSize * 0.62),
      damage: attack / 3,
      interval: 300,
      animationRight: EnemySpriteSheet.enemyAttackEffectRight(),
      execute: () {
        Sounds.attackEnemyMelee();
      },
    );*/
  }

  @override
  void render(Canvas canvas) {
    // do anything
    super.render(canvas);
  }
}
