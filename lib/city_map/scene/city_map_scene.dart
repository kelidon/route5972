import 'package:flame/components.dart';
import 'package:route5972/city_map/city_map_game.dart';
import 'package:route5972/city_map/mixin/route_animation_mixin.dart';
import 'package:route5972/city_map/model/interactive_item.dart';
import 'package:route5972/city_map/model/interactive_map.dart';

class CityMapScene extends RectangleComponent
    with HasGameReference<CityMapGame>, SceneAnimationMixin {
  @override
  Future<void> onLoad() async {
    size = game.size;
    position = Vector2.zero();
    opacity = 0.0;

    await add(
      InteractiveMap(
        backgroundImage: 'city_map.jpg',
        interactiveItems: [
          InteractiveItem(
            position: Vector2(100, 180),
            size: Vector2.all(48),
            name: 'The Broken Comet Bar',
            image: 'location.png',
            onTap: () async {
              await fadeOut(() {
                game.router.pushNamed(CityMapGame.bar);
              });
            },
          ),
          InteractiveItem(
            position: Vector2(120, 350),
            size: Vector2.all(48),
            name: '404 Tech Pit',
            image: 'location.png',
            onTap: () {
              //todo переход
            },
          ),
          InteractiveItem(
            position: Vector2(200, 240),
            size: Vector2.all(48),
            name: 'Aero-Gate Vector 9',
            image: 'location.png',
            onTap: () {
              //todo переход
            },
          ),
        ],
      ),
    );

    await fadeIn(); // Fade in when loaded
  }
}
