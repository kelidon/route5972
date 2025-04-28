import 'package:flame/components.dart';
import 'package:route5972/audio/audio_service.dart';
import 'package:route5972/common/components/back_button.dart';
import 'package:route5972/common/components/interactive_item.dart';
import 'package:route5972/common/components/interactive_map.dart';
import 'package:route5972/common/mixin/scene_transition_mixin.dart';
import 'package:route5972/main_game.dart';

class BarScene extends RectangleComponent
    with HasGameReference<MainGame>, SceneTransitionMixin {
  @override
  Future<void> onLoad() async {
    size = game.size;
    position = Vector2.zero();
    opacity = 0.0;

    audio.music(Music.bar);

    await add(
      InteractiveMap(
        backgroundImage: 'bar.png',
        interactiveItems: [
          InteractiveItem(
            position: Vector2(game.size.x*0.7, game.size.y*0.48),
            size: Vector2.all(88),
            name: 'Bartender',
            image: 'npc2.png',
            onTap: () async {
              final dialog = game.plotService.getNPCDialog('npc2');

              if (dialog == null) {
                return;
              }

              game.showDialog(dialog);
            },
          ),
          InteractiveItem(
            position: Vector2(game.size.x*0.15, game.size.y*0.6),
            size: Vector2.all(88),
            name: 'Taria',
            image: 'npc1.png',
            onTap: () async {
              final dialog = game.plotService.getNPCDialog('npc1');

              if (dialog == null) {
                return;
              }
              game.showDialog(dialog);
            },
          ),
          BackButtonComponent(
            onBack: () => fadeOut(() async {
              await audio.fadeOutCurrent();
              game.router.pushReplacementNamed(MainGame.map);
            }),
          ),
        ],
      ),
    );

    fadeIn();
  }
}
