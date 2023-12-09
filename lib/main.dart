import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      cameraConfig: CameraConfig(zoom: 5),
      player: MainChar(Vector2(173, 200)),
    );
  }
}
