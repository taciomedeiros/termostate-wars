import 'package:bonfire/bonfire.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/shared/player_sprite_sheet.dart';

// not sure if we'll keep with this
enum PlayerAttackType {
  attackMelee,
  attackRange,
}

// good to track during update to control actions
enum PlayerState {
  idle,
  attackMelee,
  attackRange,
}

class MainChar extends SimplePlayer with BlockMovementCollision {
  double attack = 1;
  double pSpeed = 1;
  double maxSteam = 100;
  int attackInterval = 300;
  PlayerState currentState = PlayerState.idle;
  late BarLifeComponent lifeBar;

  MainChar(Vector2 position)
      : super(
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
          size: Vector2.all(16),
          position: position,
          speed: 64,
          life: 200,
        ) {
    setupMovementByJoystick(intensityEnabled: true);
  }
  @override
  void onJoystickChangeDirectional(JoystickDirectionalEvent event) {
    if (hasGameRef && gameRef.sceneBuilderStatus.isRunning) {
      return;
    }

    super.onJoystickChangeDirectional(event);
  }

  bool isAttack(JoystickActionEvent event) =>
      event.id == LogicalKeyboardKey.space ||
      event.id == PlayerAttackType.attackMelee;

  @override
  void onJoystickAction(JoystickActionEvent event) {
    if (hasGameRef && gameRef.sceneBuilderStatus.isRunning || isDead) {
      return;
    }
    if (event.event == ActionEvent.DOWN) {
      if (isAttack(event)) {
        currentState = PlayerState.attackMelee;
      }
    }

    super.onJoystickAction(event);
  }

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
    if (currentState == PlayerState.attackMelee) {
      speed = 0;
    }
    if (currentState == PlayerState.idle) {
      speed = 64;
      if (checkInterval('attack', attackInterval, dt)) {
        execAttack();
      }
    }
    super.update(dt);
  }

  void _playAttackAnimation() {
    Vector2 definedSize = Vector2.all(48);
    Vector2 offset = Vector2.all(-16);
    switch (lastDirection) {
      case Direction.right:
      case Direction.downRight:
        animation?.playOnceOther(
          PlayerAnimation.attackRight,
          size: definedSize,
          offset: offset,
          onFinish: () => currentState = PlayerState.idle,
        );
      case Direction.left:
      case Direction.downLeft:
        animation?.playOnceOther(
          PlayerAnimation.attackRight,
          size: definedSize,
          offset: offset,
          flipX: true,
          onFinish: () => currentState = PlayerState.idle,
        );
      case Direction.down:
        animation?.playOnceOther(
          PlayerAnimation.attackDown,
          size: definedSize,
          offset: offset,
          onFinish: () => currentState = PlayerState.idle,
        );
      case Direction.up:
      case Direction.upLeft:
      case Direction.upRight:
        animation?.playOnceOther(
          PlayerAnimation.attackUp,
          size: definedSize,
          offset: offset,
          onFinish: () => currentState = PlayerState.idle,
        );
      default:
        animation?.playOnceOther(
          PlayerAnimation.die,
          size: definedSize, // the bug is here
          offset: offset, // the bug is here
          onFinish: () => currentState = PlayerState.idle,
        );
    }
  }

  Future<void> execAttack() async {
    // if (currentState == PlayerState.attackMelee) {
    //   return;
    // }
    currentState = PlayerState.attackMelee;
    _playAttackAnimation();
    await Future.delayed(
      const Duration(milliseconds: 200),
    ); // Adjust the duration as needed
    simpleAttackMelee(
      size: Vector2.all(tileSize * 1),
      damage: attack,
    );
  }
}
