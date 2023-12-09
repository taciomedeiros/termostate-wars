import 'package:bonfire/bonfire.dart';

class Wall extends GameDecoration {
  Wall({required super.position, required super.size});

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: size));
    return super.onLoad();
  }
}
