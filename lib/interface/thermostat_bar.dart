import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class ThermostatBarComponent extends InterfaceComponent {
  double padding = 20;
  double widthBar = 90;
  double heightBar = 20;
  double strokeWidth = 6;

  double maxTemperature = 100;
  double temperature = 0;

  ThermostatBarComponent()
      : super(
          id: 2,
          position: Vector2(650, 5),
          size: Vector2(120, 40),
        );

  @override
  Future<void> onLoad() {
    return super.onLoad();
  }

  @override
  void update(double t) {
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
    final basePaint = Paint()
      ..color = Colors.blueGrey[800]!
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    double xBar = 29;
    double yBar = 10;
    canvas.drawLine(
      Offset(xBar, yBar),
      Offset(xBar, yBar + heightBar),
      basePaint,
    );

    canvas.drawCircle(Offset(xBar, yBar + heightBar), 5, basePaint);

    double currentTemperature = (temperature * height) / maxTemperature;

    final colorPaint = Paint()
      ..color = _getColorTemperature(currentTemperature)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    canvas.drawLine(
      Offset(xBar, yBar + heightBar - currentTemperature),
      Offset(xBar, yBar + heightBar),
      colorPaint,
    );
    canvas.drawCircle(Offset(xBar, yBar + heightBar), 5, colorPaint);
  }

  Color _getColorTemperature(double currentTemperature) {
    if (currentTemperature > height - (heightBar / 3)) {
      return Colors.red;
    }
    if (currentTemperature > (widthBar / 3)) {
      return Colors.orange;
    } else {
      return Colors.blue;
    }
  }
}
