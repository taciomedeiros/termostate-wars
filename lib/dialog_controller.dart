import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thermostate_wars/npcs/mage_enemy_sprite_sheet.dart';

class DialogConfig {
  String text;
  Widget animation;
  PersonSayDirection direction;

  DialogConfig({
    required this.text,
    required this.animation,
    this.direction = PersonSayDirection.LEFT,
  });
}

final mageIdleWidget = MageEnemySpriteSheet.idleDown.asWidget();

final initialDialog = [
  DialogConfig(
    text: "Well, let's see what fate has in store for us!",
    animation: mageIdleWidget,
  ),
  DialogConfig(
    text: "There is a lot of heat out there, you need to stay hydrated!",
    animation: mageIdleWidget,
  ),
  DialogConfig(
    text: "But on cold days, don't forget to turn on the heater!",
    animation: mageIdleWidget,
  ),
];

final endBlueEnemyDialog = [];
final endRedEnemyDialog = [];
final endMageEnemyDialog = [];

class DialogController {
  static showDialog(gameRef, List<DialogConfig> dialog, {Function? onClose}) {
    TalkDialog.show(
      gameRef.context,
      onClose: () {
        onClose?.call();
      },
      dialog.map((say) {
        return Say(
          text: [
            TextSpan(text: say.text, style: const TextStyle(fontFamily: 'VT323', fontSize: 36))
          ],
          person: SizedBox(
            width: 150,
            height: 150,
            child: say.animation,
          ),
          personSayDirection: say.direction,
        );
      }).toList(),
    );
  }
}
