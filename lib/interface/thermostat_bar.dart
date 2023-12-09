import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class ThermostatBarComponent extends InterfaceComponent {
  double padding = 20;
  double widthBar = 90;
  double strokeWidth = 12;

  double maxTemperature = 0;
  double temperature = 0;

  ThermostatBarComponent()
      : super(
          id: 2,
          position: Vector2(0, 20),
          size: Vector2(120, 40),
        );

  @override
  Future<void> onLoad() {
    //position = Vector2(gameRef.size.x / 2, 20);
    // TODO: implement onLoad
    return super.onLoad();
  }

  @override
  void update(double t) {
    if (gameRef.player != null) {
      //life = gameRef.player!.life;
      //maxLife = gameRef.player!.maxLife;
    }
    super.update(t);
  }

  @override
  void render(Canvas c) {
    try {
      _drawThermostat(c);
    } catch (e) {}
    super.render(c);
  }

  void _drawThermostat(Canvas canvas) {
    double xBar = 29;
    double yBar = 10;
    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + widthBar, yBar),
        Paint()
          ..color = Colors.blueGrey[800]!
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);

    double currentBarLife = (temperature * widthBar) / maxTemperature;

    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + currentBarLife, yBar),
        Paint()
          ..color = _getColorTemperature(currentBarLife)
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);
  }

  Color _getColorTemperature(double currentBarLife) {
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
