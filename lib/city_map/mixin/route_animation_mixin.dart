import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

mixin SceneAnimationMixin on RectangleComponent {
  static const double duration = 0.69;

  Future<void> fadeOut(VoidCallback onComplete) async {
    add(
      ColorFadeComponent(
        size: size,
        color: Colors.black.withValues(alpha: 0),
      )..add(
          OpacityEffect.fadeIn(
            EffectController(duration: duration),
            onComplete: onComplete,
          ),
        ),
    );
  }

  Future<void> fadeIn() async {
    add(
      ColorFadeComponent(
        size: size,
        color: Colors.black,
      )..add(
          OpacityEffect.fadeOut(
            EffectController(duration: duration),
          ),
        ),
    );
  }
}

class ColorFadeComponent extends RectangleComponent {
  ColorFadeComponent({
    required Color color,
    super.size,
    super.paint,
  }) {
    paint.color = color;
  }
}
