import 'package:flame/components.dart';
import 'package:route5972/city_map/model/interactive_item.dart';
import 'package:route5972/city_map/model/interactive_map.dart';
import 'package:route5972/common/mixin/scene_transition_mixin.dart';
import 'package:route5972/main_game.dart';

class BarScene extends RectangleComponent with HasGameReference<MainGame>, SceneTransitionMixin {
  @override
  Future<void> onLoad() async {
    size = game.size;
    position = Vector2.zero();
    opacity = 0.0;

    await add(
      InteractiveMap(
        backgroundImage: 'bar.jpg',
        interactiveItems: [
          //todo add more items
          InteractiveItem(
            position: Vector2(100, 180),
            size: Vector2.all(48),
            name: 'Bartender',
            image: 'npc.png',
            onTap: () async {
              final dialog = game.plotService.getNPCDialog('npc1');

              if (dialog == null) {
                return;
              }

              game.showDialog(dialog);
            },
          ),
        ],
      ),
    );

    fadeIn();
  }
}
