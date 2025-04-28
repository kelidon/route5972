import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

class Wall extends BodyComponent {
  Wall(this._points);

  final List<Vector2> _points;

  @override
  Body createBody() {
    final bodyDef = BodyDef()
      ..type = BodyType.static
      ..position = Vector2.zero();

    final chain = ChainShape()..createChain(_points);

    final fixtureDef = FixtureDef(chain)
      ..restitution = 0.0
      ..friction = 0.3;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final path = Path();
    if (_points.isEmpty) return;
    
    path.moveTo(_points.first.x, _points.first.y);
    for (final point in _points.skip(1)) {
      path.lineTo(point.x, point.y);
    }
    canvas.drawPath(path, paint);
  }
}