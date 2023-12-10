import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/game_controller.dart';
import 'package:thermostate_wars/interface/my_life_bar.dart';
import 'package:thermostate_wars/interface/thermostat_bar.dart';
// import 'package:darkness_dungeon/interface/bar_life_component.dart';
// import 'package:darkness_dungeon/player/knight.dart';

class MyGameInterface extends GameInterface {
  int temperature = 0;
  String get amountOfKillsByType => 'Temperature: $temperature °C';
  TextComponent amountOfKeysComponent = TextComponent(text: '');

  GameController? _gameController;

  @override
  Future<void> onLoad() async {
    add(MyLifeBarComponent());
    add(ThermostatBarComponent());
    amountOfKeysComponent.text = amountOfKillsByType;
    amountOfKeysComponent.position = Vector2(gameRef.size.x / 2 - 64, 10);
    add(amountOfKeysComponent);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (_gameController != null) {
      temperature = _gameController!.temperature;
    } else {
      final gameControllerList = gameRef.query<GameController>();

      if (gameControllerList.isNotEmpty) {
        _gameController = gameControllerList.first;
      }
    }
    super.update(dt);
  }
}
