import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/enemy_creator_controller.dart';
import 'package:thermostate_wars/game_controller.dart';
import 'package:thermostate_wars/interface/my_game_interface.dart';
import 'package:thermostate_wars/player.dart';
import 'package:thermostate_wars/my_world.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }
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
  EnemyCreatorController enemyCreator =
      EnemyCreatorController(mapSize * tileSize);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      showCollisionArea: true,
      joystick: kIsWeb
          ? Joystick(
              keyboardConfig: KeyboardConfig(
                directionalKeys: KeyboardDirectionalKeys.arrows(),
                acceptedKeys: [
                  LogicalKeyboardKey.space,
                ],
              ),
            )
          : Joystick(
              directional: JoystickDirectional(color: Colors.black12),
              actions: [
                JoystickAction(
                  actionId: PlayerAttackType.attackMelee,
                  color: Colors.black12,
                  opacityKnob: 0.6,
                  size: 80,
                  margin: const EdgeInsets.only(bottom: 50, right: 50),
                ),
              ],
            ), // required
      map: MyWorld('maps/thermostate_wars.json'),
      components: [GameController()],
      interface: MyGameInterface(),
      cameraConfig: CameraConfig(zoom: initialZoom, moveOnlyMapArea: true),
      player: MainChar(initialPlayerPosition),
    );
  }
}
