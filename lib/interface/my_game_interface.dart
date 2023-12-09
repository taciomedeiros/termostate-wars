import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/interface/my_life_bar.dart';
import 'package:thermostate_wars/interface/thermostat_bar.dart';
// import 'package:darkness_dungeon/interface/bar_life_component.dart';
// import 'package:darkness_dungeon/player/knight.dart';

class MyGameInterface extends GameInterface {
  //late Sprite key;
  int redKills = 10;
  int blueKills = 1;

  int get temperature => -blueKills + redKills;
  String get amountOfKillsByType => 'Temperature: $temperature °C';
  TextComponent amountOfKeysComponent = TextComponent(text: '');

  @override
  Future<void> onLoad() async {
    //key = await Sprite.load('items/key_silver.png');
    add(MyLifeBarComponent());
    add(ThermostatBarComponent());
    amountOfKeysComponent.text = amountOfKillsByType;
    amountOfKeysComponent.position = Vector2(gameRef.size.x / 2 - 64, 10);
    add(amountOfKeysComponent);

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    try {
      //_drawKey(canvas);
    } catch (e) {}
    super.render(canvas);
  }

  /*void _drawKey(Canvas c) {
    /*if (gameRef.player != null && (gameRef.player as Knight).containKey) {
      key.renderRect(c, Rect.fromLTWH(150, 20, 35, 30));
    }*/
  }*/
}
