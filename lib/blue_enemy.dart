import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/shared/blue_enemy_sprite_sheet.dart';

class BlueEnemy extends SimpleEnemy {
  bool _seePlayerClose = false;
  double? attack;
  int attackInterval = blueEnemyConfig.attackInterval;

  BlueEnemy(Vector2 position, {this.attack})
      : super(
          position: position, //required
          size: blueEnemyConfig.size, //required
          life: blueEnemyConfig.life,
          speed: blueEnemyConfig.speed,
          initDirection: Direction.right,
          animation: BlueEnemySpriteSheet.simpleDirectionAnimation,
        );

  @override
  void update(double dt) {
    _seePlayerClose = false;
    seePlayer(
      observed: (player) {
        _seePlayerClose = true;
        seeAndMoveToPlayer(
          closePlayer: (player) {
            if (checkInterval('attack', attackInterval, dt)) {
              execAttack();
            }
          },
          radiusVision: tileSize * blueEnemyConfig.rangeVision,
        );
      },
      radiusVision: tileSize * blueEnemyConfig.rangeVision,
    );
    if (!_seePlayerClose) {
      seeAndMoveToAttackRange(
        positioned: (p) {},
        radiusVision: 0,
      );
    }
    super.update(dt);
  }

  @override
  void die() {
    gameRef.add(
      AnimatedGameObject(
        animation: BlueEnemySpriteSheet.die,
        position: position,
        size: blueEnemyConfig.size,
        loop: false,
      ),
    );
    removeFromParent();
    super.die();
  }

  void _playAttackAnimation() {
    Vector2 definedSize = Vector2.all(48);
    Vector2 offset = Vector2.all(-16);
    switch (lastDirection) {
      case Direction.right:
      case Direction.downRight:
      case Direction.upRight:
        animation?.playOnceOther(
          BlueEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
        );
      case Direction.left:
      case Direction.downLeft:
      case Direction.upLeft:
        animation?.playOnceOther(
          BlueEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
          flipX: true,
        );
      case Direction.down:
        animation?.playOnceOther(
          BlueEnemyAnimation.attackDown,
          size: definedSize,
          offset: offset,
        );
      case Direction.up:
        animation?.playOnceOther(
          BlueEnemyAnimation.attackDown,
          size: definedSize,
          offset: offset,
          flipY: true,
        );

      default:
        animation?.playOnceOther(
          BlueEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
        );
    }
  }

  // 192 - 64

  void execAttack() {
    _playAttackAnimation();
    simpleAttackMelee(
      size: Vector2.all(tileSize * 0.62),
      damage: attack ?? blueEnemyConfig.attack,
      interval: attackInterval,
      execute: () {
        //Sounds.attackEnemyMelee();
      },
    );
  }

  @override
  void render(Canvas canvas) {
    // do anything
    super.render(canvas);
  }
}
