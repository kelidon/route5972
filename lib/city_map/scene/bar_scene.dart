import 'package:flame/components.dart';
import 'package:route5972/city_map/city_map_game.dart';
import 'package:route5972/city_map/mixin/route_animation_mixin.dart';
import 'package:route5972/city_map/model/interactive_item.dart';
import 'package:route5972/city_map/model/interactive_map.dart';

class BarScene extends RectangleComponent
    with HasGameReference<CityMapGame>, SceneAnimationMixin {
  @override
  Future<void> onLoad() async {
    size = game.size;
    position = Vector2.zero();
    opacity = 0.0;

    await add(
      InteractiveMap(
        backgroundImage: 'bar.jpg',
        interactiveItems: [
          //todo add more items
          InteractiveItem(
            position: Vector2(100, 180),
            size: Vector2.all(48),
            name: 'Bartender',
            image: 'npc.png',
            onTap: () async {
              await fadeOut(() {
                game.router.pushNamed(CityMapGame.map);
              });
            },
          ),
        ],
      ),
    );
    fadeIn();
  }
}
