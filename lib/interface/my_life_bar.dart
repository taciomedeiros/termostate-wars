import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class MyLifeBarComponent extends InterfaceComponent {
  double padding = 20;
  double widthBar = 90;
  double strokeWidth = 12;

  double maxLife = 0;
  double life = 0;

  MyLifeBarComponent()
      : super(
          id: 1,
          position: Vector2(20, 20),
          size: Vector2(120, 40),
        );

  @override
  void update(double t) {
    if (gameRef.player != null) {
      life = gameRef.player!.life;
      maxLife = gameRef.player!.maxLife;
    }
    super.update(t);
  }

  @override
  void render(Canvas c) {
    _drawLife(c);
    super.render(c);
  }

  void _drawLife(Canvas canvas) {
    double xBar = 29;
    double yBar = 10;
    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + widthBar, yBar),
        Paint()
          ..color = Colors.blueGrey[800]!
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);

    double currentBarLife = (life * widthBar) / maxLife;

    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + currentBarLife, yBar),
        Paint()
          ..color = _getColorLife(currentBarLife)
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);
  }

  Color _getColorLife(double currentBarLife) {
    if (currentBarLife > widthBar - (widthBar / 3)) {
      return Colors.green;
    }
    if (currentBarLife > (widthBar / 3)) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
