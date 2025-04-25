import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:route5972/main_game.dart';

class RacingSceneBackground extends SpriteComponent with HasGameReference<MainGame> {
  @override
  Future<void> onLoad() async {
    /// 👌
    final background = await Flame.images.load("background.png");

    size = game.canvasSize;
    sprite = Sprite(background);
  }
}
