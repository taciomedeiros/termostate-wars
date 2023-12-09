import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/enemy_creator.dart';
import 'package:thermostate_wars/interface/my_game_interface.dart';
import 'package:thermostate_wars/player.dart';
import 'package:thermostate_wars/my_world.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thermostate war',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyGameWidget(),
    );
  }
}

class MyGameWidget extends StatefulWidget {
  const MyGameWidget({
    super.key,
  });

  @override
  State<MyGameWidget> createState() => _MyGameWidgetState();
}

class _MyGameWidgetState extends State<MyGameWidget> {
  EnemyCreator enemyCreator = EnemyCreator(mapSize * tileSize);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      showCollisionArea: true,
      joystick: Joystick(
        keyboardConfig: KeyboardConfig(
          directionalKeys: KeyboardDirectionalKeys.arrows(),
          acceptedKeys: [
            LogicalKeyboardKey.space,
          ],
        ),
        directional: JoystickDirectional(),
      ), // required
      map: MyWorld('mapa.json'),
      interface: MyGameInterface(),
      cameraConfig: CameraConfig(zoom: 5),
      player: MainChar(Vector2(173, 200)),
    );
  }
}
