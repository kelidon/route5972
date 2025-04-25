import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:route5972/city_map/scene/bar_scene.dart';
import 'package:route5972/city_map/scene/city_map_scene.dart';
import 'package:route5972/city_map/scene/tech_pit_scene.dart';
import 'package:route5972/city_map/scene/terminal_scene.dart';
import 'package:route5972/dialog/model/dialog_data.dart';

class CityMapGame extends FlameGame with TapDetector {
  late final RouterComponent router;

  static const String map = 'map';
  static const String bar = 'bar';
  static const String techPit = 'techPit';
  static const String terminal = 'terminal';

  static const dialogOverlayIdentifier = 'dialogOverlay';

  @override
  Future<void> onLoad() async {
    router = RouterComponent(
      initialRoute: map,
      routes: {
        map: Route(CityMapScene.new),
        bar: Route(BarScene.new),
        techPit: Route(TechPitScene.new),
        terminal: Route(TerminalScene.new),
      },
    );

    add(router);
  }

  DialogData? currentDialog;

  void showDialog(DialogData dialogData) {
    currentDialog = dialogData;
    overlays.add(dialogOverlayIdentifier);
  }

  void hideDialog() {
    overlays.remove(dialogOverlayIdentifier);
    currentDialog = null;
  }
}
