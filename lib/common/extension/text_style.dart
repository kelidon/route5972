import 'package:flame/game.dart';
import 'package:flutter/material.dart';

extension TextPaintExtension on TextPaint {
  TextPaint get bold => copyWith(
        (s) => s.copyWith(fontWeight: FontWeight.bold),
      );
  TextPaint get underline => copyWith(
        (s) => s.copyWith(decoration: TextDecoration.underline),
      );
  TextPaint get reversedColor => copyWith(
        (s) => s.copyWith(color: Colors.black),
      );
  TextPaint withColor(Color color) => copyWith(
        (s) => s.copyWith(color: color),
      );
}
