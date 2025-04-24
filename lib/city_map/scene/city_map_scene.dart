import 'package:flame/components.dart';
import 'package:route5972/city_map/city_map_game.dart';
import 'package:route5972/city_map/model/interactive_item.dart';
import 'package:route5972/city_map/model/interactive_map.dart';

class CityMapScene extends Component with HasGameReference<CityMapGame> {
  @override
  Future<void> onLoad() async {
    add(
      InteractiveMap(
        backgroundImage: 'city_map.jpg',
        interactiveItems: [
          InteractiveItem(
            position: Vector2(100, 180),
            size: Vector2.all(48),
            name: 'The Broken Comet Bar',
            image: 'location.png',
            onTap: () {
              //todo переход в бар возможно с зумом
              //тапы не проходят
              print("bar tapped");
              game.router.pushNamed(CityMapGame.bar);
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
  }
}
