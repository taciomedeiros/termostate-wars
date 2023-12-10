import 'package:bonfire/bonfire.dart';

double tileSize = 16;
double initialZoom = 5;
Vector2 mapSize = Vector2.all(30);
Vector2 initialPlayerPosition = Vector2(150, 200);
Vector2 initialMagePosition = Vector2(80, 200);
Vector2 initialBossPosition = Vector2(80, 300);
//Vector2 initialBossPosition = Vector2(90, 230);

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
  attackInterval: 600,
);

final blueEnemyConfig = EnemyConfig(
  life: 2,
  size: Vector2.all(16),
  speed: 10,
  rangeVision: 20,
  attack: 20,
  attackInterval: 600,
);

final blueBossEnemyConfig = EnemyConfig(
  life: 10,
  size: Vector2.all(32),
  speed: 20,
  rangeVision: 200,
  attack: 20,
  attackInterval: 1000,
);

final redBossEnemyConfig = EnemyConfig(
  life: 20,
  size: Vector2.all(32),
  speed: 50,
  rangeVision: 500,
  attack: 20,
  attackInterval: 800,
);
