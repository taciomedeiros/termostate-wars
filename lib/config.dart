import 'package:bonfire/bonfire.dart';

double tileSize = 16;
double initialZoom = 5;
Vector2 mapSize = Vector2.all(30);
Vector2 initialPlayerPosition = Vector2(168, 200);
Vector2 initialMagePosition = Vector2(80, 200);

double timeInSecondsAppearingEnemies = 5;

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
    life: 2,
    size: Vector2.all(16),
    speed: 5,
    rangeVision: 20,
    attack: 20,
    attackInterval: 600);

final blueEnemyConfig = EnemyConfig(
  life: 2,
  size: Vector2.all(16),
  speed: 10,
  rangeVision: 20,
  attack: 20,
  attackInterval: 600,
);
