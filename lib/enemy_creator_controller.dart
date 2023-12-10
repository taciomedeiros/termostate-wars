import 'dart:math';

import 'package:bonfire/npc/enemy/simple_enemy.dart';
import 'package:flame/components.dart';
import 'package:rxdart/subjects.dart';
import 'package:thermostate_wars/enemies/blue_enemy.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/enemies/red_boss_enemy.dart';
import 'package:thermostate_wars/enemies/red_enemy.dart';
import 'package:thermostate_wars/game_controller.dart';

enum EnemyCreatorStatus { running, stopped }

class EnemyCreatorController extends TimerComponent with HasGameRef {
  final Random random = Random();
  final Vector2 worldSize;

  late int maxX;
  late int maxY;

  int stageFactor = 1;
  int redAmountForCreation = 1;
  int blueAmountForCreation = 1;
  double blueAtack = blueEnemyConfig.attack;
  double redAtack = redEnemyConfig.attack;

  bool isCreatedBoss = false;

  Map<int, int> enemiesByStage = {
    1: 20,
    2: 40,
    3: 80,
  };

  EnemyCreatorStatus status = EnemyCreatorStatus.stopped;

  EnemyCreatorController(this.worldSize)
      : super(period: timeInSecondsAppearingEnemies, repeat: true) {
    maxX = (worldSize.x.toInt() - tileSize * 5).toInt();
    maxY = (worldSize.y.toInt() - tileSize * 2).toInt();
  }

  BehaviorSubject<BlueEnemy> blueEnemyDied = BehaviorSubject<BlueEnemy>();
  BehaviorSubject<RedEnemy> redEnemyDied = BehaviorSubject<RedEnemy>();
  BehaviorSubject<GameStatus> gameStatus = BehaviorSubject<GameStatus>();
  int blueDeadEnemies = 0;
  int redDeadEnemies = 0;

  int next(int min, int max) => min + random.nextInt(max - min);

  double get randomX => next(30, maxX).toDouble();

  double get randomY => next(30, maxY).toDouble();

  void onBlueBossDie(SimpleEnemy enemy) {
    gameStatus.add(GameStatus.blueBoss);
  }

  void onRedBossDie(SimpleEnemy enemy) {
    gameStatus.add(GameStatus.redBoss);
  }

  void onFinishEqualGames() {
    gameStatus.add(GameStatus.draw);
  }

  void initBoss() {
    isCreatedBoss = true;
    status = EnemyCreatorStatus.stopped;
  }

  void checkBossCondition() {
    if (isCreatedBoss) {
      return;
    }

    const amountEnemies = 1;

    if (blueDeadEnemies == redDeadEnemies && redDeadEnemies == amountEnemies) {}

    if (blueDeadEnemies >= amountEnemies) {
      initBoss();
      gameRef.add(RedBossEnemy(initialBossPosition, notifyDeath: onRedBossDie));
    } else if (redDeadEnemies >= amountEnemies) {
      initBoss();
      gameRef.add(RedBossEnemy(initialBossPosition, notifyDeath: onRedBossDie));
    }
  }

  void enemyCreatorNotifyDeath(SimpleEnemy enemy) {
    if (enemy is BlueEnemy) {
      blueEnemyDied.add(enemy);
      blueDeadEnemies++;
      checkBossCondition();
    }

    if (enemy is RedEnemy) {
      redEnemyDied.add(enemy);
      redDeadEnemies++;
      checkBossCondition();
    }
  }

  void addBlueEnemies() {
    gameRef.addAll(
      List.generate(
        blueAmountForCreation,
        (index) => BlueEnemy(
          Vector2(randomX, randomY),
          attack: blueAtack,
          notifyDeath: enemyCreatorNotifyDeath,
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
          notifyDeath: enemyCreatorNotifyDeath,
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
