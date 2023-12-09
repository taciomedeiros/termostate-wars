import 'package:bonfire/bonfire.dart';
import 'package:thermostate_wars/interface/my_life_bar.dart';
// import 'package:darkness_dungeon/interface/bar_life_component.dart';
// import 'package:darkness_dungeon/player/knight.dart';

class MyGameInterface extends GameInterface {
  //late Sprite key;

  @override
  Future<void> onLoad() async {
    //key = await Sprite.load('items/key_silver.png');
    add(MyLifeBarComponent());
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
