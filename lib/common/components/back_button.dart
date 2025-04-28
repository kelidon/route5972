import 'dart:ui';

import 'package:flame/components.dart';
import 'package:route5972/common/components/interactive_item.dart';
import 'package:route5972/main_game.dart';

class BackButtonComponent extends Component with HasGameReference<MainGame> {
  BackButtonComponent({
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  Future<void> onLoad() async {
    final buttonPosition = Vector2(game.size.x - 80, 40);

    await add(
      InteractiveItem(
        position: buttonPosition,
        size: Vector2.all(48),
        name: 'Exit',
        image: 'npc1.png',
        onTap: onBack,
      ),
    );
  }
}
