import 'package:flame/components.dart';
import 'package:route5972/common/components/back_button.dart';
import 'package:route5972/common/components/c_button_comp.dart'
    show CButtonComp;
import 'package:route5972/common/components/interactive_item.dart';
import 'package:route5972/common/components/interactive_map.dart';
import 'package:route5972/common/mixin/scene_transition_mixin.dart';
import 'package:route5972/main_game.dart';

class TerminalScene extends RectangleComponent
    with HasGameReference<MainGame>, SceneTransitionMixin {
  @override
  Future<void> onLoad() async {
    size = game.size;
    position = Vector2.zero();
    opacity = 0.0;

    await add(
      InteractiveMap(
        backgroundImage: 'aero_terminal.png',
        interactiveItems: [
          InteractiveItem(
            position: Vector2(100, 180),
            size: Vector2.all(48),
            name: 'Agent',
            image: 'npc.png',
            onTap: () {
              //todo
              print('talk to agent');
            },
          ),
          BackButtonComponent(
              onBack: () => fadeOut(
                  () => game.router.pushReplacementNamed(MainGame.map))),
          CButtonComp(
            content: "There's no one here yet...",
            position: game.size / 2,
            anchor: Anchor.center,
            width: game.size.x * 0.7,
            onPressed: () {},
          ),
        ],
      ),
    );

    fadeIn();
  }
}
