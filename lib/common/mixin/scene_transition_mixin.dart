import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

mixin SceneTransitionMixin on RectangleComponent {
  static const double duration = 0.69;

  Future<void> fadeOut(VoidCallback onComplete) async {
    add(
      _ColorFadeComponent(size: size, color: Colors.black.withValues(alpha: 0))
        ..add(
          OpacityEffect.fadeIn(
            EffectController(duration: duration),
            onComplete: onComplete,
          ),
        ),
    );
  }

  Future<void> fadeIn() async {
    add(
      _ColorFadeComponent(size: size, color: Colors.black)
        ..add(OpacityEffect.fadeOut(EffectController(duration: duration))),
    );
  }
}

class _ColorFadeComponent extends RectangleComponent {
  _ColorFadeComponent({required Color color, super.size}) {
    priority = 1000;
    paint.color = color;
  }
}
