import 'dart:ui' show Color;

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:route5972/main_game.dart';

class InteractiveMap extends RectangleComponent with HasGameReference<MainGame>, TapCallbacks {
  final String backgroundImage;
  final List<Component> interactiveItems;

  InteractiveMap({required this.backgroundImage, required this.interactiveItems});

  @override
  Future<void> onLoad() async {
    paint.color = const Color(0xFF000000);
    final mapBackground = SpriteComponent(
      sprite: await game.loadSprite(backgroundImage),
      size: game.size,
    );
    add(mapBackground);

    addAll(interactiveItems);
  }
}
