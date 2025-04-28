import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/services.dart';
import 'package:route5972/audio/audio_service.dart';
import 'package:route5972/common/components/back_button.dart';
import 'package:route5972/common/components/interactive_item.dart';
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
  static const double playZoom = 3;
  late Map<LogicalKeyboardKey, LogicalKeyboardKey> activeKeyMap;
  late Set<LogicalKeyboardKey> pressedKeySet;
  late final Ship ship;

  bool isGameOver = false;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    audio.music(Music.race);
    start();
  }

  Future<void> start() async {
    final map = await TiledComponent.load('map.tmx', Vector2.all(32));
    isGameOver = false;

    pressedKeySet = {};
    activeKeyMap = controlKeys;

    game.camera.viewfinder.zoom = playZoom;
    game.camera.viewfinder.anchor = Anchor.center;

    // Add background
    final background = await game.loadSprite('race1.png');
    final backgroundComponent = SpriteComponent(
      sprite: background,
      size: Vector2(map.tileMap.map.width * 32, map.tileMap.map.height * 32),
      priority: -1,
    );
    game.world.add(backgroundComponent);

    game.world.add(map);

    addWalls(map);
    addShip(map);
    await add(
      BackButtonComponent(
        onBack: () =>
            fadeOut(() => game.router.pushReplacementNamed(MainGame.bar)),
      ),
    );
  }

  void addWalls(TiledComponent component) {
    final objectGroup = component.tileMap.getLayer<ObjectGroup>('walls');

    for (final obj in objectGroup!.objects) {
      if (obj.isPolyline || obj.isPolygon) {
        final points = obj.isPolyline ? obj.polyline : obj.polygon;

        final absolutePoints =
            points.map((p) => Vector2(obj.x + p.x, obj.y + p.y)).toList();

        if (obj.isPolygon && absolutePoints.isNotEmpty) {
          absolutePoints.add(absolutePoints.first);
        }

        game.world.add(Wall(absolutePoints));
      }
    }
  }

  void addShip(TiledComponent component) {
    final objectGroup = component.tileMap.getLayer<ObjectGroup>('config');
    Vector2? startingPoint;
    for (final obj in objectGroup!.objects) {
      if (obj.class_ == 'start' && obj.isPoint) {
        startingPoint = obj.position;
      }
    }
    ship = Ship(
      pressedKeys: pressedKeySet,
      cameraComponent: game.camera,
      startingPoint: startingPoint ?? Vector2.zero(),
    );
    game.world.add(ship);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isGameOver) {
      return;
    }
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

        //print('pressed ${activeKeyMap[key]}');
      }
    }
    return true;
  }

  void _clearPressedKeys() {
    pressedKeySet.clear();
  }
}
