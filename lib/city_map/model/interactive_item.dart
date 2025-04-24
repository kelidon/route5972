import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';

/// локация на карте города или нпс персонаж в локации
class InteractiveItem extends SpriteComponent with TapCallbacks {
  final String name;
  final String image;
  final VoidCallback? onTap;

  InteractiveItem({
    required Vector2 position,
    required this.name,
    required this.image,
    this.onTap,
    super.size,
  }) : super(position: position);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(image);
  }

  @override
  void onTapDown(TapDownEvent event) {
    onTap?.call();
  }
}
