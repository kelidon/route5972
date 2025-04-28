import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:route5972/main_game.dart';

/// локация на карте города или нпс персонаж в локации
class InteractiveItem extends SpriteComponent
    with HasGameReference<MainGame>, TapCallbacks, HoverCallbacks {
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
  void onTapCancel(TapCancelEvent event) {
    onTap?.call();
  }

  @override
  void onHoverEnter() {
    game.mouseCursor = SystemMouseCursors.click;
  }

  @override
  void onHoverExit() {
    game.mouseCursor = SystemMouseCursors.basic;
  }
}
