import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/shared/red_enemy_sprite_sheet.dart';

class RedEnemy extends SimpleEnemy {
  bool _seePlayerClose = false;
  double attack;
  int attackInterval = 600;

  RedEnemy(Vector2 position, this.attack)
      : super(
          position: position, //required
          size: Vector2.all(redEnemySize), //required
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
        //animation?.showStroke(Colors.white, 1);
        seeAndMoveToPlayer(
          closePlayer: (player) {
            if (checkInterval('attack', attackInterval, dt)) {
              execAttack();
            }
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

  void _playAttackAnimation() {
    switch (lastDirection) {
      case Direction.right:
        animation?.playOnceOther(
          RedEnemyAnimation.attackRight,
          size: Vector2.all(64),
          offset: Vector2(-20, -20),
        );
      case Direction.left:
        animation?.playOnceOther(
          RedEnemyAnimation.attackRight,
          size: Vector2.all(64),
          offset: Vector2(-20, -20),
          flipX: true,
        );
      case Direction.down:
        animation?.playOnceOther(
          RedEnemyAnimation.attackDown,
          size: Vector2.all(64),
          offset: Vector2(-20, -20),
        );
      case Direction.up:
        animation?.playOnceOther(
          RedEnemyAnimation.attackDown,
          size: Vector2.all(64),
          offset: Vector2(-20, -20),
          flipY: true,
        );

      default:
        animation?.playOnceOther(
          RedEnemyAnimation.attackRight,
          size: Vector2.all(64),
          offset: Vector2(-20, -20),
        );
    }
  }

  // 192 - 64

  void execAttack() {
    _playAttackAnimation();
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
