import 'package:flutter/material.dart';
import 'package:route5972/city_map/city_map_page.dart';
import 'package:route5972/main_menu/main_menu_page.dart';
import 'package:route5972/race/race_page.dart';
import 'package:route5972/ui/not_found_page.dart';

class AppRouter {
  static const String home = '/';
  static const String cityMap = '/cityMap';
  static const String race = '/race';

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const MainMenuPage());
      case cityMap:
        return MaterialPageRoute(builder: (_) => const CityMapPage());
      case race:
        return MaterialPageRoute(builder: (_) => const RacePage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
