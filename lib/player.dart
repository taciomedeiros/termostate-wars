import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
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
        // execMeleeAttack(attack);
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
        size: Vector2(6, 12),
        position: Vector2(
          5,
          4,
        ),
      ),
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (currentState == PlayerState.attackMelee) {
      _playAttackAnimation();
    }
    // final roundedPositionVector = position.clone();
    //roundedPositionVector.round();
    // textPosition.text = roundedPositionVector.toString();
    super.update(dt);
  }

  // void execMeleeAttack(double attack) {
  //   simpleAttackMelee(
  //       damage: attack,
  //       animationRight: PlayerSpriteSheet.attackRight,
  //       size: Vector2.all(32));
  // }

  void _playAttackAnimation() {
    animation?.playOnceOther(
      PlayerSpriteSheet.attackRight,
      onFinish: () {
        currentState = PlayerState.idle;
      },
    );
  }
  // switch (lastDirection) {
  //   case Direction.left:
  //     animation?.playOnceOther(PersonAttackEnum.meeleLeft);
  // //     break;
  // //   case Direction.right:
  // //     animation?.playOnceOther(PersonAttackEnum.meeleRight);
  // //     break;
  // //   case Direction.up:
  // //     animation?.playOnceOther(PersonAttackEnum.meeleUp);
  // //     break;
  // //   case Direction.down:
  // //     animation?.playOnceOther(PersonAttackEnum.meeleDown);
  // //     break;
  // //   case Direction.upLeft:
  // //     animation?.playOnceOther(PersonAttackEnum.meeleUpLeft);
  // //     break;
  // //   case Direction.upRight:
  // //     animation?.playOnceOther(PersonAttackEnum.meeleUpRight);
  // //     break;
  // //   case Direction.downLeft:
  // //     animation?.playOnceOther(PersonAttackEnum.meeleDownLeft);
  // //     break;
  // //   case Direction.downRight:
  // //     animation?.playOnceOther(PersonAttackEnum.meeleDownRight);
  // //     break;
  // // }
}
