import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/enemies/blue_boss_sprite_sheet.dart';
import 'package:thermostate_wars/enemies/blue_enemy_sprite_sheet.dart';

class BlueBossEnemy extends SimpleEnemy with PathFinding {
  Function(SimpleEnemy enemy) notifyDeath;
  bool _seePlayerClose = false;
  double? attack;
  int attackInterval = blueBossEnemyConfig.attackInterval;
  int attackId = 1001;

  bool trackedPlayer = false;

  BlueBossEnemy(Vector2 position, {this.attack, required this.notifyDeath})
      : super(
          position: position, //required
          size: blueBossEnemyConfig.size, //required
          life: blueBossEnemyConfig.life,
          speed: blueBossEnemyConfig.speed,
          initDirection: Direction.right,
          animation: BlueBossEnemySpriteSheet.simpleDirectionAnimation,
        );

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(8, 16),
        position: Vector2(12, 12),
      ),
    );

    return super.onLoad();
  }

  vaiProPlayer() {
    moveTowardsTarget(target: gameRef.player!);
  }

  @override
  void update(double dt) {
    _seePlayerClose = false;

    if (!trackedPlayer && gameRef.player != null) {
      trackedPlayer = true;
      //vaiProPlayer();
    }

    seePlayer(
      notObserved: () {
        if (checkInterval('trackedPlayer', 6000, dt)) {
          //trackedPlayer = false;
        }
      },
      observed: (player) {
        _seePlayerClose = true;
        seeAndMoveToPlayer(
          closePlayer: (player) {
            if (checkInterval(
                'attack', blueBossEnemyConfig.attackInterval, dt)) {
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

  void _playAttackAnimation() {
    Vector2 definedSize = blueBossEnemyConfig.size * 3;
    Vector2 offset = Vector2.all(-32);
    switch (lastDirection) {
      case Direction.right:
      case Direction.downRight:
      case Direction.upRight:
        animation?.playOnceOther(
          BlueBossEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
          runToTheEnd: true,
        );
      case Direction.left:
      case Direction.downLeft:
      case Direction.upLeft:
        animation?.playOnceOther(
          BlueBossEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
          flipX: true,
          runToTheEnd: true,
        );
      case Direction.down:
        animation?.playOnceOther(
          BlueBossEnemyAnimation.attackDown,
          size: definedSize,
          offset: offset,
          runToTheEnd: true,
        );
      case Direction.up:
        animation?.playOnceOther(
          BlueBossEnemyAnimation.attackDown,
          size: definedSize,
          offset: offset,
          flipY: true,
          runToTheEnd: true,
        );

      default:
        animation?.playOnceOther(
          BlueBossEnemyAnimation.attackRight,
          size: definedSize,
          offset: offset,
          runToTheEnd: true,
        );
    }
  }

  void execAttack() {
    attackId++;
    simpleAttackMelee(
        size: Vector2.all(16),
        damage: blueBossEnemyConfig.attack,
        interval: 10,
        id: attackId,
        execute: () {
          //Sounds.attackEnemyMelee();
          _playAttackAnimation();
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
