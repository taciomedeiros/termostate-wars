import 'dart:math';

import 'package:flame/components.dart';
import 'package:rxdart/subjects.dart';
import 'package:thermostate_wars/blue_enemy.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/red_enemy.dart';

enum EnemyCreatorStatus { running, stopped }

class EnemyCreator extends TimerComponent with HasGameRef {
  final Random random = Random();
  final Vector2 worldSize;

  late int maxX;
  late int maxY;

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
      : super(period: timeInSecondsAppearingEnemies, repeat: true) {
    maxX = (worldSize.x.toInt() - tileSize * 5).toInt();
    maxY = (worldSize.y.toInt() - tileSize * 2).toInt();
  }

  BehaviorSubject<BlueEnemy> blueEnemyDied = BehaviorSubject<BlueEnemy>();
  BehaviorSubject<RedEnemy> redEnemyDied = BehaviorSubject<RedEnemy>();

  int next(int min, int max) => min + random.nextInt(max - min);

  double get randomX => next(30, maxX).toDouble();

  double get randomY => next(30, maxY).toDouble();

  void addBlueEnemies() {
    gameRef.addAll(
      List.generate(
        blueAmountForCreation,
        (index) => BlueEnemy(
          Vector2(randomX, randomY),
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
          Vector2(randomX, randomY),
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
