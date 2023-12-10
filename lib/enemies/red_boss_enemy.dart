import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/enemies/red_boss_sprite_sheet.dart';

class RedBossEnemy extends SimpleEnemy {
  Function(SimpleEnemy enemy) notifyDeath;
  bool _seePlayerClose = false;
  double? attack;
  int attackInterval = redBossEnemyConfig.attackInterval;

  RedBossEnemy(Vector2 position, {this.attack, required this.notifyDeath})
      : super(
          position: position, //required
          size: redBossEnemyConfig.size, //required
          life: redBossEnemyConfig.life,
          speed: redBossEnemyConfig.speed,
          initDirection: Direction.right,
          animation: RedBossEnemySpriteSheet.simpleDirectionAnimation,
        );

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: redBossEnemyConfig.size * 0.63,
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
          radiusVision: tileSize * redBossEnemyConfig.rangeVision,
        );
      },
      radiusVision: tileSize * redBossEnemyConfig.rangeVision,
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

    animation?.playOnceOther(
      RedBossEnemyAnimation.die,
      size: blueEnemyConfig.size,
    );
    removeFromParent();
    super.die();
  }

  void _playAttackAnimation(onFinish) {
    Vector2 definedSize = redBossEnemyConfig.size * 3;
    Vector2 offset = Vector2.all(-32);
    switch (lastDirection) {
      case Direction.right:
      case Direction.downRight:
      case Direction.upRight:
        animation?.playOnceOther(
          RedBossEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
          onFinish: onFinish,
        );
      case Direction.left:
      case Direction.downLeft:
      case Direction.upLeft:
        animation?.playOnceOther(
          RedBossEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
          flipX: true,
          onFinish: onFinish,
        );
      case Direction.down:
        animation?.playOnceOther(
          RedBossEnemyAnimation.attackDown,
          size: definedSize,
          offset: offset,
          onFinish: onFinish,
        );
      case Direction.up:
        animation?.playOnceOther(
          RedBossEnemyAnimation.attackDown,
          size: definedSize,
          offset: offset,
          flipY: true,
          onFinish: onFinish,
        );

      default:
        animation?.playOnceOther(
          RedBossEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
          onFinish: onFinish,
        );
    }
  }

  void execAttack() {
    _playAttackAnimation(() {
      simpleAttackMelee(
        size: Vector2.all(tileSize * 3),
        damage: attack ?? redBossEnemyConfig.attack,
        interval: attackInterval,
        execute: () {
          //Sounds.attackEnemyMelee();
        },
        //animationRight: RedBossEnemySpriteSheet.attackRight,
      );
    });
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, dynamic id) {
    showDamage(
      damage,
      config: const TextStyle(
        fontSize: 5,
        color: Colors.white,
        fontFamily: 'Normal',
      ),
    );
    super.receiveDamage(attacker, damage, id);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
