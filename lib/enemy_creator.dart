import 'dart:math';

import 'package:flame/components.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/red_enemy.dart';

class EnemyCreator extends TimerComponent with HasGameRef {
  final Random random = Random();
  final Vector2 worldSize;

  int stageFactor = 1;
  int blueToCreate = 1;
  int redAmountForCreation = 1;

  //final _halfWidth = Red.initialSize.x / 2;

  EnemyCreator(this.worldSize) : super(period: 2, repeat: true);

  @override
  void onTick() {
    gameRef.addAll(
      List.generate(
        1,
        (index) => RedEnemy(
          Vector2(
            (random.nextInt(worldSize.x.toInt()) - tileSize).toDouble(),
            (random.nextInt(worldSize.y.toInt()) - tileSize).toDouble(),
          ),
        ),
      ),
    );
  }
}
