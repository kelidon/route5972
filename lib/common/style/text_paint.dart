import 'package:flame/game.dart';
import 'package:flutter/material.dart';

abstract class TextPaints {
  static final _defaultFamily = 'Pixelify';
  static final _base = TextStyle(fontFamily: 'Pixelify');
  static final small = TextPaint(
    style: _base.copyWith(
      fontSize: 12,
      color: Colors.white,
    ),
  );

  static final regular = TextPaint(
    style: _base.copyWith(
      fontSize: 16,
      color: Colors.white,
    ),
  );

  static final large = TextPaint(
    style: _base.copyWith(
      fontSize: 24,
      color: Colors.white,
    ),
  );
}
