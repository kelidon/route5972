import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

mixin SceneAnimationMixin on RectangleComponent {
  static const double duration = 2.0;

  Future<void> fadeOut(VoidCallback onComplete) async {
    add(
      RectangleComponent(
        size: size,
        paint: Paint()..color = Colors.black,
      )..add(
          OpacityEffect.fadeIn(
            EffectController(duration: duration),
            onComplete: onComplete,
          ),
        ),
    );
  }

  Future<void> fadeIn() async {
    await add(OpacityEffect.fadeIn(EffectController(duration: duration)));
  }
}
