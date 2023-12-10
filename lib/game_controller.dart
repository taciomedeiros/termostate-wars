import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/enemy_creator_controller.dart';

class GameController extends GameComponent {
  int temperature = 0;
  EnemyCreatorController enemyCreator =
      EnemyCreatorController(mapSize * tileSize);
  Map<String, int> killedEnemies = {"blue": 0, "red": 0};
  bool isInitialized = false;
  bool startEnemyCreation = false;
  bool showGameOver = false;

  @override
  FutureOr<void> onLoad() {
    enemyCreator.redEnemyDied.listen((_) {
      killedEnemies["red"] = killedEnemies["red"]! + 1;
      calcTemperature();
    });
    enemyCreator.blueEnemyDied.listen((_) {
      killedEnemies["blue"] = killedEnemies["blue"]! + 1;
      calcTemperature();
    });

    add(enemyCreator);
    return super.onLoad();
  }

  int calcTemperature() {
    temperature = -killedEnemies["blue"]! + killedEnemies["red"]!;
    return temperature;
  }

  @override
  void update(double dt) {
    if (startEnemyCreation && !isInitialized) {
      isInitialized = true;
      startEnemyCreation = false;
      enemyCreator.status = EnemyCreatorStatus.running;
    }
    /*if (checkInterval('gameOver', 100, dt)) {
      if (gameRef.player != null && gameRef.player?.isDead == true) {
        if (!showGameOver) {
          showGameOver = true;
          _showDialogGameOver();
        }
      }
    }*/
    super.update(dt);
  }

  /*

  void _showDialogGameOver() {
    showGameOver = true;
    Dialogs.showGameOver(
      context,
      () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Game()),
          (Route<dynamic> route) => false,
        );
      },
    );
  }*/
}
