import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Particle, World;
import 'package:flutter/material.dart' hide Image, Gradient;
import 'package:flutter/services.dart';
import 'package:route5972/space_game.dart';

class Ship extends BodyComponent<SpaceGame> {
  Ship({required this.cameraComponent, required this.pressedKeys})
    : super(priority: 3, paint: Paint()..color = Colors.red);

  final Set<LogicalKeyboardKey> pressedKeys;

  final CameraComponent cameraComponent;
  late final Image _image;
  final size = const Size(6, 10);
  final scale = 10.0;

  final _speedDiff = 400.0;
  final _forceDiff = 400.0;

  late final _renderPosition = -size.toOffset() / 2;
  late final _scaledRect = (size * scale).toRect();
  late final _renderRect = _renderPosition & size;

  final vertices = <Vector2>[
    Vector2(1.5, -5.0),
    Vector2(3.0, -2.5),
    Vector2(2.8, 0.5),
    Vector2(1.0, 5.0),
    Vector2(-1.0, 5.0),
    Vector2(-2.8, 0.5),
    Vector2(-3.0, -2.5),
    Vector2(-1.5, -5.0),
  ];

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final recorder = PictureRecorder();
    final canvas = Canvas(recorder, _scaledRect);
    final path = Path();
    final bodyPaint = Paint()..color = paint.color;
    for (var i = 0.0; i < _scaledRect.width / 4; i++) {
      bodyPaint.color = bodyPaint.color.darken(0.1);
      path.reset();
      final offsetVertices =
          vertices
              .map(
                (v) =>
                    v.toOffset() * scale -
                    Offset(i * v.x.sign, i * v.y.sign) +
                    _scaledRect.bottomRight / 2,
              )
              .toList();
      path.addPolygon(offsetVertices, true);
      canvas.drawPath(path, bodyPaint);
    }
    final picture = recorder.endRecording();
    _image = await picture.toImage(_scaledRect.width.toInt(), _scaledRect.height.toInt());
  }

  @override
  Body createBody() {
    //player.png sprite

    final startPosition = Vector2(20, 30) + Vector2(15, 0);
    final def =
        BodyDef()
          ..type = BodyType.dynamic
          ..position = startPosition;
    final body =
        world.createBody(def)
          ..userData = this
          ..angularDamping = 3.0;

    final shape = PolygonShape()..set(vertices);
    final fixtureDef =
        FixtureDef(shape)
          ..density = 0.2
          ..restitution = 2.0;

    body.createFixture(fixtureDef);

    return body;
  }

  @override
  void update(double dt) {
    cameraComponent.viewfinder.position = body.position;

    if (body.isAwake || pressedKeys.isNotEmpty) {
      _updateFlight(dt);
      _updateRotation(dt);
    }
  }

  void _updateFlight(double dt) {
    if (pressedKeys.contains(LogicalKeyboardKey.arrowUp)) {
      body.applyForce(body.worldVector(Vector2(0.0, -1.0))..scale(_forceDiff * dt));
    }
    if (pressedKeys.contains(LogicalKeyboardKey.arrowDown)) {
      body.applyForce(body.worldVector(Vector2(0.0, 1.0))..scale(_forceDiff * dt));
    }
  }

  void _updateRotation(double dt) {
    if (pressedKeys.contains(LogicalKeyboardKey.arrowLeft)) {
      body.applyAngularImpulse(-_speedDiff * dt);
    }
    if (pressedKeys.contains(LogicalKeyboardKey.arrowRight)) {
      body.applyAngularImpulse(_speedDiff * dt);
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawImageRect(_image, _scaledRect, _renderRect, paint);
  }

  @override
  void onRemove() {
    super.onRemove();
    world.destroyBody(body);
  }
}
