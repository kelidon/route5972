import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:route5972/common/style/text_paint.dart';

class CButtonComp extends ButtonComponent with HoverCallbacks {
  CButtonComp({
    required this.content,
    required super.onPressed,
    this.width = 200,
    this.enableAnimation = true,
    super.anchor,
    super.position,
  });

  final String content;
  final double width;
  final bool enableAnimation;

  @override
  FutureOr<void> onLoad() {
    button = CTextBoxComp(
      text: content,
      boxConfig: TextBoxConfig(
        maxWidth: width,
        margins: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        growingBox: true,
        timePerChar: enableAnimation ? 0.1 : 0,
      ),
    );
    return super.onLoad();
  }

  @override
  void onHoverEnter() {
    add(ScaleEffect.to(Vector2(1.05, 1.05), EffectController(duration: 0.05)));
  }

  @override
  void onHoverExit() {
    add(ScaleEffect.to(Vector2(1, 1), EffectController(duration: 0.05)));
  }
}

class CTextBoxComp extends TextBoxComponent {
  CTextBoxComp({
    required super.text,
    required super.boxConfig,
    TextPaint? textRenderer,
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
    super.key,
  }) {
    textRenderer ??= TextPaints.regular;
    super.textRenderer = textRenderer;
  }

  final bgPaint = Paint()..color = Color(0xFF000000);
  final borderPaint = Paint()
    ..color = Color(0xFFFFFFFF).withOpacity(0.5)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  @override
  void render(Canvas canvas) {
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    canvas.drawRect(rect, bgPaint);
    canvas.drawRect(rect, borderPaint);
    super.render(canvas);
  }
}
