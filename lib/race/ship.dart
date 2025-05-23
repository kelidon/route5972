import 'dart:ui';

import 'package:flame/camera.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Particle, World;
import 'package:flutter/material.dart' hide Image, Gradient;
import 'package:flutter/services.dart';
import 'package:route5972/main_game.dart';

class Ship extends BodyComponent<MainGame> {
  Ship({required this.pressedKeys, required this.cameraComponent, required this.startingPoint})
    : super(priority: 3, paint: Paint()..color = Colors.green);

  final size = Size(17, 30);
  final _rotationSpeedDiff = 30000.0;
  final _linearSpeedDiff = 1500000.0;
  final Vector2 startingPoint;

  final Set<LogicalKeyboardKey> pressedKeys;
  final CameraComponent cameraComponent;

  late final Image _image;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _image = await Flame.images.load('player.png');
  }

  @override
  Body createBody() {
    final def =
        BodyDef()
          ..type = BodyType.dynamic
          ..position = startingPoint
          ..gravityOverride = Vector2.zero();
    final body =
        world.createBody(def)
          ..userData = this
          ..angularDamping = 2.0
          ..linearDamping = 0.2
          ..linearVelocity = Vector2.zero()
          ..angularVelocity = 0.0;

    final shape =
        PolygonShape()..set([
          Vector2(-size.width / 2, size.height / 2),
          Vector2(size.width / 2, size.height / 2),
          Vector2(0.0, -size.height / 2),
        ]);

    final fixtureDef =
        FixtureDef(shape)
          ..density = 0.1
          ..restitution = 0.2;

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
      body.applyForce(body.worldVector(Vector2(0.0, -1.0))..scale(_linearSpeedDiff * dt));
    }
    if (pressedKeys.contains(LogicalKeyboardKey.arrowDown)) {
      body.applyForce(body.worldVector(Vector2(0.0, 1.0))..scale(_linearSpeedDiff * dt));
    }
  }

  void _updateRotation(double dt) {
    if (pressedKeys.contains(LogicalKeyboardKey.arrowLeft)) {
      body.applyAngularImpulse(-_rotationSpeedDiff * dt);
    }
    if (pressedKeys.contains(LogicalKeyboardKey.arrowRight)) {
      body.applyAngularImpulse(_rotationSpeedDiff * dt);
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawImageRect(
      _image,
      Rect.fromLTWH(0, 0, _image.width.toDouble(), _image.height.toDouble()), // Source rect
      Rect.fromLTWH(
        -8.5,
        -14,
        size.width,
        size.height,
      ), // Destination rect centered on the body
      paint,
    );
  }

  @override
  void onRemove() {
    super.onRemove();
    world.destroyBody(body);
  }
}
