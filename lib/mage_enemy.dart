import 'package:bonfire/bonfire.dart';
import 'package:flutter/animation.dart';
import 'package:thermostate_wars/config.dart';
import 'package:thermostate_wars/dialog_controller.dart';
import 'package:thermostate_wars/game_controller.dart';
import 'package:thermostate_wars/shared/mage_enemy_sprite_sheet.dart';

class MageEnemy extends SimpleNpc with BlockMovementCollision {
  bool initializedDialog = false;

  MageEnemy(Vector2 position)
      : super(
          position: position,
          size: Vector2.all(16),
          initDirection: Direction.right,
          animation: MageEnemySpriteSheet.simpleDirectionAnimation,
        );

  void hideTalk(zoom) {
    gameRef.camera.moveToPlayerAnimated(
      effectController: EffectController(
        duration: 0.5,
        curve: Curves.easeInOut,
      ),
      zoom: zoom,
    );

    final gameControllerList = gameRef.query<GameController>();

    if (gameControllerList.isNotEmpty) {
      gameControllerList.first.startEnemyCreation = true;
    }

    removeFromParent();
  }

  void showTalk() {
    final lastZoom = gameRef.camera.zoom;

    gameRef.player!.stopMove();

    gameRef.camera.moveToTargetAnimated(
      target: this,
      effectController: EffectController(
        duration: 0.5,
        curve: Curves.easeInOut,
      ),
      zoom: 10,
      onComplete: DialogController.showDialog(
        gameRef,
        initialDialog,
        onClose: () {
          hideTalk(lastZoom);
        },
      ),
    );
  }

  @override
  void update(double dt) {
    seePlayer(
      observed: (player) {
        if (!initializedDialog) {
          initializedDialog = true;
          showTalk();
        }
      },
      radiusVision: tileSize * 2,
    );
    super.update(dt);
  }
}
