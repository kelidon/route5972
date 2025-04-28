import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/services.dart';
import 'package:route5972/common/mixin/scene_transition_mixin.dart';
import 'package:route5972/main_game.dart';
import 'package:route5972/race/ship.dart';
import 'package:route5972/race/wall.dart';

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

class RacingScene extends RectangleComponent
    with HasGameReference<MainGame>, KeyboardHandler, SceneTransitionMixin {
  static final Vector2 mapSize = Vector2.all(500);
  static const double playZoom = 1;
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
    final ship = Ship(pressedKeys: pressedKeySet, cameraComponent: game.camera);

    game.camera.viewfinder.zoom = playZoom;
    game.camera.viewfinder.anchor = Anchor.center;

    //game.world.add(RacingSceneBackground());
    game.world.add(ship);

    final map = await TiledComponent.load('map.tmx', Vector2.all(32));

    game.world.add(map);

    addWalls(map);
  }

  void addWalls(TiledComponent component) {
    final objectGroup = component.tileMap.getLayer<ObjectGroup>('walls');

    for (final obj in objectGroup!.objects) {
      if (obj.isPolyline) {
        final points = obj.polyline;

        final absolutePoints = points.map((p) => Vector2(p.x, p.y)).toList();

        game.world.add(Wall(absolutePoints, game.size));
      }
    }
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
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (!isLoaded || isGameOver) {
      return false;
    }

    _clearPressedKeys();
    for (final key in keysPressed) {
      if (activeKeyMap.containsKey(key)) {
        pressedKeySet.add(activeKeyMap[key]!);

        print('pressed ${activeKeyMap[key]}');
      }
    }
    return true;
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
