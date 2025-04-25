import 'dart:ui' show Color;

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:route5972/city_map/city_map_game.dart';
import 'package:route5972/city_map/model/interactive_item.dart';

class InteractiveMap extends RectangleComponent
    with HasGameReference<CityMapGame>, TapCallbacks {
  final String backgroundImage;
  final List<InteractiveItem> interactiveItems;

  InteractiveMap(
      {required this.backgroundImage, required this.interactiveItems});

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
