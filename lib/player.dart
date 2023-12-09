import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/shared/player_sprite_sheet.dart';

enum PlayerAttackType {
  attackMelee,
  attackRange,
}

enum PlayerState {
  wait,
  walk,
  attackMelee,
  attackRange,
}

class MainChar extends SimplePlayer {
  double attack = 1;
  double pSpeed = 1;
  double maxSteam = 100;

  late BarLifeComponent lifeBar;

  MainChar(Vector2 position)
      : super(
          animation: PlayerSpriteSheet.simpleDirectionAnimation,
          size: Vector2.all(64),
          position: position,
          speed: 1,
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
}
