import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:route5972/city_map/scene/bar_scene.dart';
import 'package:route5972/city_map/scene/city_map_scene.dart';
import 'package:route5972/city_map/scene/audio_switch_scene.dart';
import 'package:route5972/city_map/scene/tech_pit_scene.dart';
import 'package:route5972/city_map/scene/terminal_scene.dart';
import 'package:route5972/dialog/model/dialog_data.dart';
import 'package:route5972/race/racing_scene.dart';

class MainGame extends Forge2DGame
    with TapDetector, HasKeyboardHandlerComponents {
  late final RouterComponent router;

  static const String map = 'map';
  static const String bar = 'bar';
  static const String techPit = 'techPit';
  static const String terminal = 'terminal';
  static const String race = 'race';
  static const String intro = 'intro';

  static const dialogOverlayIdentifier = 'dialogOverlay';

  DialogData? currentDialog;

  @override
  Future<void> onLoad() async {
    router = RouterComponent(
      initialRoute: intro,
      routes: {
        map: Route(CityMapScene.new),
        bar: Route(BarScene.new),
        techPit: Route(TechPitScene.new),
        terminal: Route(TerminalScene.new),
        race: Route(RacingScene.new),
        intro: Route(AudioSwitchScene.new),
      },
    );

    add(router);
  }

  void showDialog(DialogData dialogData) {
    currentDialog = dialogData;
    overlays.add(dialogOverlayIdentifier);
  }

  void hideDialog() {
    overlays.remove(dialogOverlayIdentifier);
    currentDialog = null;
  }
}
