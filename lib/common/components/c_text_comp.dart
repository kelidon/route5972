import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:route5972/common/style/text_paint.dart';

class CTextComp extends TextComponent<TextPaint> {
  CTextComp(
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
    this.onEnd,
    super.key,
  });

  final String content;
  final bool animate;
  final TextPaint? style;
  final VoidCallback? onEnd;
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
          if (length == content.length) {
            running = false;
            onEnd?.call();
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
