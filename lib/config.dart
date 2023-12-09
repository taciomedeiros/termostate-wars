import 'package:bonfire/bonfire.dart';

double tileSize = 16;
Vector2 mapSize = Vector2.all(20);

class PlayerConfig {}

class EnemyConfig {
  double life;
  Vector2 size;
  double speed;
  double rangeVision;
  double attack;

  EnemyConfig({
    required this.life,
    required this.size,
    required this.speed,
    required this.rangeVision,
    required this.attack,
  });
}

final redEnemyConfig = EnemyConfig(
  life: 10,
  size: Vector2.all(16),
  speed: 5,
  rangeVision: 20,
  attack: 20,
);

final blueEnemyConfig = EnemyConfig(
  life: 10,
  size: Vector2.all(16),
  speed: 5,
  rangeVision: 20,
  attack: 20,
);
