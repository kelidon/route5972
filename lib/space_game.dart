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
  late Map<LogicalKeyboardKey, LogicalKeyboardKey> activeKeyMap;
  late Set<LogicalKeyboardKey> pressedKeySet;
  final ships = <Ship>[];
  Ship? winner;
  double _timeCounter = 0;
  bool isGameOver = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    start();
  }

  Future<void> start() async {
    isGameOver = false;

    pressedKeySet = {};
    activeKeyMap = controlKeys;
    final ship = Ship(
      pressedKeys: pressedKeySet,
      position: Vector2.zero(),
    );
    camera.viewfinder.zoom = playZoom;
    add(SpaceGameBackground());
    world.add(ship);
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
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
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
