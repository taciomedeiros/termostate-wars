import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/enemies/blue_boss_sprite_sheet.dart';
import 'package:thermostate_wars/enemies/blue_enemy_sprite_sheet.dart';

class BlueBossEnemy extends SimpleEnemy {
  Function(SimpleEnemy enemy) notifyDeath;
  bool _seePlayerClose = false;
  double? attack;
  int attackInterval = blueBossEnemyConfig.attackInterval;

  BlueBossEnemy(Vector2 position, {this.attack, required this.notifyDeath})
      : super(
          position: position, //required
          size: blueBossEnemyConfig.size, //required
          life: blueBossEnemyConfig.life,
          speed: blueBossEnemyConfig.speed,
          initDirection: Direction.right,
          animation: BlueEnemySpriteSheet.simpleDirectionAnimation,
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
          radiusVision: tileSize * blueBossEnemyConfig.rangeVision,
        );
      },
      radiusVision: tileSize * blueBossEnemyConfig.rangeVision,
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
      BlueEnemyAnimation.die,
      size: blueEnemyConfig.size,
    );
    removeFromParent();
    super.die();
  }

  void _playAttackAnimation(onFinish) {
    Vector2 definedSize = Vector2.all(48);
    Vector2 offset = Vector2.all(-16);
    switch (lastDirection) {
      case Direction.right:
      case Direction.downRight:
      case Direction.upRight:
        animation?.playOnceOther(
          BlueBossEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
          onFinish: onFinish,
        );
      case Direction.left:
      case Direction.downLeft:
      case Direction.upLeft:
        animation?.playOnceOther(
          BlueBossEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
          flipX: true,
          onFinish: onFinish,
        );
      case Direction.down:
        animation?.playOnceOther(
          BlueEnemyAnimation.attackDown,
          size: definedSize,
          offset: offset,
          onFinish: onFinish,
        );
      case Direction.up:
        animation?.playOnceOther(
          BlueBossEnemyAnimation.attackDown,
          size: definedSize,
          offset: offset,
          flipY: true,
          onFinish: onFinish,
        );

      default:
        animation?.playOnceOther(
          BlueBossEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
          onFinish: onFinish,
        );
    }
  }

  void execAttack() {
    _playAttackAnimation(() {
      simpleAttackRange(
          size: Vector2.all(tileSize * 0.62),
          damage: attack ?? blueEnemyConfig.attack,
          interval: attackInterval,
          execute: () {
            //Sounds.attackEnemyMelee();
          },
          animationRight: BlueBossEnemySpriteSheet.idleRight,
          animationDestroy: BlueBossEnemySpriteSheet.idleRight,
          collision: CircleHitbox(
            radius: 10.0,
          ));
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
