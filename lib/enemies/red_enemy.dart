import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/enemies/red_enemy_sprite_sheet.dart';

class RedEnemy extends SimpleEnemy {
  Function(SimpleEnemy enemy) notifyDeath;
  bool _seePlayerClose = false;
  double? attack;
  int attackInterval = 600;

  RedEnemy(Vector2 position, {this.attack, required this.notifyDeath})
      : super(
          position: position, //required
          size: redEnemyConfig.size, //required
          life: redEnemyConfig.life,
          speed: redEnemyConfig.speed,
          initDirection: Direction.right,
          animation: RedEnemySpriteSheet.simpleDirectionAnimation,
        );

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(3, 5),
        position: Vector2(
          6,
          6,
        ),
      ),
    );
    return super.onLoad();
  }

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
          radiusVision: tileSize * redEnemyConfig.rangeVision,
        );
      },
      radiusVision: tileSize * redEnemyConfig.rangeVision,
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
    notifyDeath?.call(this);
    gameRef.add(
      AnimatedGameObject(
        animation: RedEnemySpriteSheet.die,
        position: position,
        size: redEnemyConfig.size,
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
          RedEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
        );
      case Direction.left:
      case Direction.downLeft:
      case Direction.upLeft:
        animation?.playOnceOther(
          RedEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
          flipX: true,
        );
      case Direction.down:
        animation?.playOnceOther(
          RedEnemyAnimation.attackDown,
          size: definedSize,
          offset: offset,
        );
      case Direction.up:
        animation?.playOnceOther(
          RedEnemyAnimation.attackDown,
          size: definedSize,
          offset: offset,
          flipY: true,
        );

      default:
        animation?.playOnceOther(
          RedEnemyAnimation.attackRight,
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
      damage: attack ?? redEnemyConfig.attack,
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
