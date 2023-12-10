import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:thermostate_wars/game_controller.dart';
import 'package:thermostate_wars/interface/my_life_bar.dart';
import 'package:thermostate_wars/interface/thermostat_bar.dart';
// import 'package:darkness_dungeon/interface/bar_life_component.dart';
// import 'package:darkness_dungeon/player/knight.dart';

class MyGameInterface extends GameInterface {
  TextPaint textPaint = TextPaint(
    style: const TextStyle(
      fontSize: 36.0,
      fontFamily: 'VT323',
      color: Colors.white
    ),
  );

  int temperature = 0;
  String get amountOfKillsByType => 'Temperature: $temperature °C';
  TextComponent amountOfKeysComponent = TextComponent(text: '');
  ThermostatBarComponent thermostatBarComponent = ThermostatBarComponent();

  GameController? _gameController;

  @override
  Future<void> onLoad() async {
    add(MyLifeBarComponent());
    add(thermostatBarComponent);
    amountOfKeysComponent.text = amountOfKillsByType;
    amountOfKeysComponent.position = Vector2(gameRef.size.x / 2 - 36, 10);
    amountOfKeysComponent.textRenderer= textPaint;
    add(amountOfKeysComponent);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (_gameController != null) {
      temperature = _gameController!.temperature;
      thermostatBarComponent.temperature = temperature.toDouble();
      amountOfKeysComponent.text = amountOfKillsByType;
    } else {
      final gameControllerList = gameRef.query<GameController>();

      if (gameControllerList.isNotEmpty) {
        _gameController = gameControllerList.first;
      }
    }
    super.update(dt);
  }
}
