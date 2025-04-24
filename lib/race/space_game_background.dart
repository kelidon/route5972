import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:route5972/race/space_game.dart';

class SpaceGameBackground extends SpriteComponent with HasGameReference<SpaceGame> {
  SpaceGameBackground();

  @override
  Future<void> onLoad() async {
    /// 👌
    final background = await Flame.images.load("background.png");

    size = game.canvasSize;
    sprite = Sprite(background);
  }
}
