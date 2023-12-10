import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';
import 'package:thermostate_wars/shared/mage_enemy_sprite_sheet.dart';

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
    text: 'Bom vamos ver o que o destino nos reserva!',
    animation: mageIdleWidget,
  ),
  DialogConfig(
    text: 'Existe muito calor por ai é preciso se manter hidratado!',
    animation: mageIdleWidget,
  ),
  DialogConfig(
    text: 'Mas nos dias de frio não se pode esquecer de ligar o aquecedor!',
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
            TextSpan(text: say.text, style: const TextStyle(fontSize: 22))
          ],
          person: SizedBox(
            width: 100,
            height: 100,
            child: say.animation,
          ),
          personSayDirection: say.direction,
        );
      }).toList(),
    );
  }
}
