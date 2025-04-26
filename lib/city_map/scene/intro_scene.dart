import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:route5972/audio/audio_service.dart';
import 'package:route5972/common/mixin/scene_transition_mixin.dart';
import 'package:route5972/main_game.dart';

class IntroScene extends RectangleComponent
    with HasGameReference<MainGame>, SceneTransitionMixin {
  late RectangleComponent parentRect;

  // Future<void> nextPage() async {
  //   await fadeOut(() {
  //     game.router.pushReplacementNamed(MainGame.map);
  //   });
  // }

  @override
  Future<void> onLoad() async {
    size = game.size;
    paint = Paint()..color = Color(0xFF000000);
    audio.load();
    fadeIn();
    parentRect = RectangleComponent(
      size: game.size,
      paint: Paint()..color = Color(0xFF000000),
    );

    addAll([parentRect]);

    _updateLayout();

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    size = size;
    parentRect.size = size;
    _updateLayout();
  }

  void _updateLayout() {}
}
