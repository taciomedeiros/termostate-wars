import 'package:bonfire/bonfire.dart';
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
  PlayerState currentState = PlayerState.idle;

  TextComponent textPosition = TextComponent(text: '', size: Vector2.all(.2));

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
    // setupLighting(
    //   LightingConfig(
    //     radius: width * 1.5,
    //     color: Colors.transparent,
    //   ),
    // );
  }
  @override
  void onJoystickChangeDirectional(JoystickDirectionalEvent event) {
    if (hasGameRef && gameRef.sceneBuilderStatus.isRunning) {
      return;
    }
    super.onJoystickChangeDirectional(event);
  }

  @override
  void onJoystickAction(JoystickActionEvent event) {
    if (hasGameRef && gameRef.sceneBuilderStatus.isRunning || isDead) {
      return;
    }
    if (event.event == ActionEvent.DOWN) {
      if (event.id == LogicalKeyboardKey.space ||
          event.id == PlayerAttackType.attackMelee) {
        // if (barLifeController.stamina >= 15) {
        //   decrementStamina(15);
        currentState = PlayerState.attackMelee;
        execAttack();
      }
      //execMeleeAttack(attack);
    }

    super.onJoystickAction(event);
  }

  @override
  Future<void> onLoad() {
    //add(textPosition);
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
    if (currentState == PlayerState.attackMelee) {}
    // final roundedPositionVector = position.clone();
    //roundedPositionVector.round();
    // textPosition.text = roundedPositionVector.toString();
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
        );
      case Direction.left:
      case Direction.downLeft:
        animation?.playOnceOther(
          PlayerAnimation.attackRight,
          size: definedSize,
          offset: offset,
          flipX: true,
        );
      case Direction.down:
        animation?.playOnceOther(
          PlayerAnimation.attackDown,
          size: definedSize,
          offset: offset,
        );
      case Direction.up:
        animation?.playOnceOther(
          PlayerAnimation.attackUp,
          size: definedSize,
          offset: offset,
        );
      default:
        animation?.playOnceOther(
          PlayerAnimation.die,
          size: definedSize, // the bug is here
          offset: offset, // the bug is here
        );
    }
  }

  void execAttack() {
    _playAttackAnimation();
    simpleAttackMelee(
      size: Vector2.all(tileSize * 1),
      damage: attack,
    );
  }
}
