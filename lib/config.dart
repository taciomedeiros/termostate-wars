import 'package:bonfire/bonfire.dart';

double tileSize = 16;
Vector2 mapSize = Vector2.all(20);
double timeInSecodsAppearingEnemies = 5;

class PlayerConfig {}

class EnemyConfig {
  double life;
  Vector2 size;
  double speed;
  double rangeVision;
  double attack;
  int attackInterval;

  EnemyConfig({
    required this.life,
    required this.size,
    required this.speed,
    required this.rangeVision,
    required this.attack,
    required this.attackInterval,
  });
}

final redEnemyConfig = EnemyConfig(
    life: 10,
    size: Vector2.all(16),
    speed: 5,
    rangeVision: 20,
    attack: 20,
    attackInterval: 600);

final blueEnemyConfig = EnemyConfig(
  life: 10,
  size: Vector2.all(16),
  speed: 10,
  rangeVision: 20,
  attack: 20,
  attackInterval: 600,
);
