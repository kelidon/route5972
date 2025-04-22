import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:route5972/space_game.dart';

class SpaceGameBackground extends SpriteComponent with HasGameRef<SpaceGame> {
  SpaceGameBackground();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load("background.png");
    size = gameRef.size;
    sprite = Sprite(background);
  }
}