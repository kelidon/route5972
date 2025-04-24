import 'package:flame/components.dart';
import 'package:route5972/city_map/city_map_game.dart';
import 'package:route5972/city_map/model/interactive_item.dart';

class InteractiveMap extends Component with HasGameReference<CityMapGame> {
  final String backgroundImage;
  final List<InteractiveItem> interactiveItems;

  InteractiveMap({required this.backgroundImage, required this.interactiveItems});

  @override
  Future<void> onLoad() async {
    final mapBackground = SpriteComponent(
      sprite: await game.loadSprite(backgroundImage),
      size: game.size,
    );
    add(mapBackground);

    addAll(interactiveItems);
  }
}
