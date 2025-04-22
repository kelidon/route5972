import 'package:flutter/material.dart';
import 'package:route5972/ui/bar/bar_page.dart';
import 'package:route5972/ui/race/race_page.dart';
import 'package:route5972/ui/level_selector/level_selector.dart';
import 'package:route5972/ui/main_menu/main_menu_page.dart';
import 'package:route5972/ui/not_found_page.dart';

class AppRouter {
  static const String home = '/';
  static const String levelSelector = '/levelSelector';
  static const String bar = '/bar';
  static const String race = '/race';

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const MainMenuPage(),
        );
      case levelSelector:
        return MaterialPageRoute(
          builder: (_) => const LevelSelectorPage(),
        );
      case bar:
        return MaterialPageRoute(
          builder: (_) => const BarPage(),
        );
      case race:
        return MaterialPageRoute(
          builder: (_) => const RacePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
