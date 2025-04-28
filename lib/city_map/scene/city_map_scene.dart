import 'package:flame/components.dart';
import 'package:route5972/audio/audio_service.dart';
import 'package:route5972/common/components/interactive_item.dart';
import 'package:route5972/common/components/interactive_map.dart';
import 'package:route5972/common/mixin/scene_transition_mixin.dart';
import 'package:route5972/main_game.dart';

class CityMapScene extends RectangleComponent
    with HasGameReference<MainGame>, SceneTransitionMixin {
  @override
  Future<void> onLoad() async {
    audio.music(Music.intro0);
    size = game.size;
    position = Vector2.zero();
    opacity = 0.0;

    await add(
      InteractiveMap(
        backgroundImage: 'city_map.PNG',
        interactiveItems: [
          InteractiveItem(
            position: Vector2(game.size.x * 0.53, game.size.y * 0.45),
            size: Vector2.all(48),
            name: 'The Broken Comet Bar',
            image: 'location.png',
            onTap: () async {
              await audio.fadeOutCurrent();
              fadeOut(() {
                game.router.pushReplacementNamed(MainGame.bar);
              });
            },
          ),
          InteractiveItem(
            position: Vector2(game.size.x * 0.25, game.size.y * 0.78),
            size: Vector2.all(48),
            name: '404 Tech Pit',
            image: 'location.png',
            onTap: () async {
              await audio.fadeOutCurrent();

              await fadeOut(() {
                game.router.pushReplacementNamed(MainGame.techPit);
              });
            },
          ),
          InteractiveItem(
            position: Vector2(game.size.x * 0.15, game.size.y * 0.3),
            size: Vector2.all(48),
            name: 'Aero-Gate Vector 9',
            image: 'location.png',
            onTap: () async {
              await audio.fadeOutCurrent();

              await fadeOut(() {
                game.router.pushReplacementNamed(MainGame.terminal);
              });
            },
          ),
        ],
      ),
    );

    await fadeIn(); // Fade in when loaded
  }
}
