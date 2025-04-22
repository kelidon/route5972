import 'dart:math';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart' hide Particle, World;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:route5972/ship.dart';
import 'package:route5972/space_game_background.dart';

final Map<LogicalKeyboardKey, LogicalKeyboardKey> controlKeys = {
  LogicalKeyboardKey.arrowUp: LogicalKeyboardKey.arrowUp,
  LogicalKeyboardKey.arrowDown: LogicalKeyboardKey.arrowDown,
  LogicalKeyboardKey.arrowLeft: LogicalKeyboardKey.arrowLeft,
  LogicalKeyboardKey.arrowRight: LogicalKeyboardKey.arrowRight,
  LogicalKeyboardKey.keyW: LogicalKeyboardKey.arrowUp,
  LogicalKeyboardKey.keyS: LogicalKeyboardKey.arrowDown,
  LogicalKeyboardKey.keyA: LogicalKeyboardKey.arrowLeft,
  LogicalKeyboardKey.keyD: LogicalKeyboardKey.arrowRight,
};

class SpaceGame extends Forge2DGame with KeyboardEvents {
  SpaceGame() : super(gravity: Vector2.zero(), zoom: 1);

  @override
  Color backgroundColor() => Colors.black;

  static final Vector2 mapSize = Vector2.all(500);
  static const double playZoom = 6.0;
  late CameraComponent startCamera;
  late Map<LogicalKeyboardKey, LogicalKeyboardKey> activeKeyMap;
  late Set<LogicalKeyboardKey> pressedKeySet;
  final ships = <Ship>[];
  Ship? winner;
  double _timeCounter = 0;
  bool isGameOver = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    camera.removeFromParent();
    children.register<CameraComponent>();

    add(SpaceGameBackground());

    final zoomLevel = min(canvasSize.x / mapSize.x, canvasSize.y / mapSize.y);

    startCamera =
        CameraComponent(world: world)
          ..viewfinder.position = mapSize / 2
          ..viewfinder.anchor = Anchor.center
          ..viewfinder.zoom = zoomLevel - 0.2;

    add(startCamera);


    prepareStart();
  }

  void prepareStart() {
    startCamera.viewfinder
      ..add(
        ScaleEffect.to(Vector2.all(playZoom), EffectController(duration: 1.0), onComplete: start),
      )
      ..add(MoveEffect.to(Vector2.all(20), EffectController(duration: 1.0)));
  }

  Future<void> start() async {
    isGameOver = false;

    startCamera.removeFromParent();

    final isHorizontal = canvasSize.x > canvasSize.y;
    Vector2 alignedVector({required double longMultiplier, double shortMultiplier = 1.0}) {
      return Vector2(
        isHorizontal ? canvasSize.x * longMultiplier : canvasSize.x * shortMultiplier,
        !isHorizontal ? canvasSize.y * longMultiplier : canvasSize.y * shortMultiplier,
      );
    }

    final viewportSize = alignedVector(longMultiplier: 1);

    RectangleComponent viewportRimGenerator() =>
        RectangleComponent(size: viewportSize, anchor: Anchor.topLeft)
          ..paint.color = Colors.blue
          ..paint.strokeWidth = 2.0
          ..paint.style = PaintingStyle.stroke;
    final camera =
        CameraComponent(
            world: world,
            viewport:
                FixedSizeViewport(viewportSize.x, viewportSize.y)
                  ..position = alignedVector(longMultiplier: 0.0, shortMultiplier: 0.0)
                  ..add(viewportRimGenerator()),
          )
          ..viewfinder.anchor = Anchor.center
          ..viewfinder.zoom = playZoom;

    final mapCameraSize = Vector2.all(800);
    const mapCameraZoom = 0.5;

    final mapCamera =
        CameraComponent(
            world: world,
            viewport: FixedSizeViewport(mapCameraSize.x, mapCameraSize.y)
              ..position = Vector2(viewportSize.x - mapCameraSize.x * mapCameraZoom - 50, 50),
          )
          ..viewfinder.anchor = Anchor.topLeft
          ..viewfinder.zoom = mapCameraZoom;

    add(camera);

    pressedKeySet = {};
    activeKeyMap = controlKeys;

    final ship = Ship(cameraComponent: camera, pressedKeys: pressedKeySet);

    ships.add(ship);
    world.add(ship);
   //camera.viewport.add(mapCamera);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isGameOver) {
      return;
    }
    _timeCounter += dt;
  }

  @override
  KeyEventResult onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);
    if (!isLoaded || isGameOver) {
      return KeyEventResult.ignored;
    }

    _clearPressedKeys();
    for (final key in keysPressed) {
      if (activeKeyMap.containsKey(key)) {
        pressedKeySet.add(activeKeyMap[key]!);

        print('pressed ${activeKeyMap[key]}');
      }
    }
    return KeyEventResult.handled;
  }

  void _clearPressedKeys() {
    pressedKeySet.clear();
  }

  void reset() {
    _clearPressedKeys();
    activeKeyMap.clear();
    _timeCounter = 0;

    for (final ship in ships) {
      ship.removeFromParent();
    }
    for (final camera in children.query<CameraComponent>()) {
      camera.removeFromParent();
    }
  }

  String _numPrefix(int num) {
    return num < 10 ? '0$num' : num.toString();
  }

  String get timeValue {
    final minutes = _numPrefix((_timeCounter / 60).floor());
    final seconds = _numPrefix((_timeCounter % 60).floor());
    final ms = _numPrefix(((_timeCounter % 1) * 100).floor());
    return [minutes, seconds, ms].join(':');
  }
}
