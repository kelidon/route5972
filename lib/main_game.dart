import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:route5972/city_map/scene/audio_switch_scene.dart';
import 'package:route5972/city_map/scene/bar_scene.dart';
import 'package:route5972/city_map/scene/city_map_scene.dart';
import 'package:route5972/city_map/scene/intro_scene.dart';
import 'package:route5972/city_map/scene/tech_pit_scene.dart';
import 'package:route5972/city_map/scene/terminal_scene.dart';
import 'package:route5972/plot/model/dialog_data.dart';
import 'package:route5972/plot/plot_service.dart';
import 'package:route5972/race/racing_scene.dart';

const dialogOverlayIdentifier = 'dialogOverlay';

class MainGame extends Forge2DGame with TapDetector, HasKeyboardHandlerComponents {
  late final RouterComponent router;

  static const String map = 'map';
  static const String bar = 'bar';
  static const String techPit = 'techPit';
  static const String terminal = 'terminal';
  static const String race = 'race';
  static const String intro = 'intro';
  static const String audioSwitch = 'audioSwitch';

  final PlotService plotService = PlotService();

  @override
  Future<void> onLoad() async {
    router = RouterComponent(
      initialRoute: bar,
      routes: {
        map: Route(CityMapScene.new, maintainState: false),
        bar: Route(BarScene.new, maintainState: false),
        techPit: Route(TechPitScene.new, maintainState: false),
        terminal: Route(TerminalScene.new, maintainState: false),
        race: Route(RacingScene.new, maintainState: false),
        audioSwitch: Route(AudioSwitchScene.new, maintainState: false),
        intro: Route(IntroScene.new, maintainState: false),
      },
    );

    add(router);

    await plotService.loadData();
  }

  void showDialog(DialogData data) {
    plotService.showDialog(data);

    if (overlays.isActive(dialogOverlayIdentifier)) {
      return;
    }

    overlays.add(dialogOverlayIdentifier);
  }

  void hideDialog() => overlays.remove(dialogOverlayIdentifier);
}
