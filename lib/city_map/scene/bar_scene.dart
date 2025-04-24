import 'package:flame/components.dart';
import 'package:route5972/city_map/model/interactive_item.dart';
import 'package:route5972/city_map/model/interactive_map.dart';

class BarScene extends Component {
  @override
  Future<void> onLoad() async {
    add(
      InteractiveMap(
        backgroundImage: 'bar.jpg',
        interactiveItems: [
          //todo add more items
          InteractiveItem(
            position: Vector2(100, 180),
            size: Vector2.all(48),
            name: 'Bartender',
            image: 'npc.png',
            onTap: () {
              //todo talk to Bartender
            },
          ),
        ],
      ),
    );
  }
}
