import 'dart:async';

import 'package:flame/components.dart';
import 'package:route5972/common/style/text_paint.dart';

class CTextComponent extends TextComponent<TextPaint> {
  CTextComponent(
    this.content, {
    this.style,
    super.position,
    super.size,
    super.scale,
    super.angle,
    super.anchor,
    super.children,
    super.priority,
    this.animate = true,
    super.key,
  });

  final String content;
  final bool animate;
  final TextPaint? style;

  int length = 0;
  bool running = true;

  @override
  FutureOr<void> onLoad() {
    textRenderer = style ?? TextPaints.regular;
    if (!animate) {
      text = content;
      return super.onLoad();
    }
    add(
      TimerComponent(
        period: 0.01,
        repeat: running,
        removeOnFinish: true,
        onTick: () {
          if (!running) return;
          if (length == content.length - 1) {
            running = false;
            return;
          }
          length++;
          text = content.substring(0, length);
        },
      ),
    );
    return super.onLoad();
  }
}
