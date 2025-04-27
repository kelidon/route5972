import 'package:flame/components.dart';
import 'package:route5972/city_map/model/interactive_item.dart';
import 'package:route5972/city_map/model/interactive_map.dart';

class TechPitScene extends Component {
  @override
  Future<void> onLoad() async {
    add(
      InteractiveMap(
        backgroundImage: '404_tech_pit.png',
        interactiveItems: [
          //todo add more items
          InteractiveItem(
            position: Vector2(100, 180),
            size: Vector2.all(48),
            name: 'Mechanic',
            image: 'npc.png',
            onTap: () {
              //todo
              print('talk to mechanic');
            },
          ),
        ],
      ),
    );
  }
}
