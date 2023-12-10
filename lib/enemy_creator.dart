import 'dart:math';

import 'package:flame/components.dart';
import 'package:thermostate_wars/blue_enemy.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/red_enemy.dart';

enum EnemyCreatorStatus { running, stopped }

class EnemyCreator extends TimerComponent with HasGameRef {
  final Random random = Random();
  final Vector2 worldSize;

  int stageFactor = 1;
  int redAmountForCreation = 1;
  int blueAmountForCreation = 1;
  double blueAtack = blueEnemyConfig.attack;
  double redAtack = redEnemyConfig.attack;

  Map<int, int> enemiesByStage = {
    1: 20,
    2: 40,
    3: 80,
  };

  EnemyCreatorStatus status = EnemyCreatorStatus.stopped;

  //final _halfWidth = Red.initialSize.x / 2;

  EnemyCreator(this.worldSize)
      : super(period: timeInSecodsAppearingEnemies, repeat: true);

  void addBlueEnemies() {
    gameRef.addAll(
      List.generate(
        blueAmountForCreation,
        (index) => BlueEnemy(
          Vector2(
            (random.nextInt(worldSize.x.toInt()) - tileSize).toDouble(),
            (random.nextInt(worldSize.y.toInt()) - tileSize).toDouble(),
          ),
          attack: blueAtack,
        ),
      ),
    );
  }

  void addRedEnemies() {
    gameRef.addAll(
      List.generate(
        redAmountForCreation,
        (index) => RedEnemy(
          Vector2(
            (random.nextInt(worldSize.x.toInt()) - tileSize).toDouble(),
            (random.nextInt(worldSize.y.toInt()) - tileSize).toDouble(),
          ),
          attack: redAtack,
        ),
      ),
    );
  }

  @override
  void onTick() {
    if (status == EnemyCreatorStatus.running) {
      addRedEnemies();
      addBlueEnemies();
    }
  }
}
