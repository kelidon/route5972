import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Wall extends PositionComponent {
  Wall(this.points, Vector2 size) : super(position: points.first, anchor: Anchor.center, size: size);

  final List<Vector2> points;

  @override
  void render(Canvas canvas) {
    final paint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke;

    final path = Path()..moveTo(0, 0);
    for (final p in points) {
      path.lineTo(p.x, p.y);
    }
    canvas.drawPath(path, paint);
  }
}