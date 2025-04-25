import 'package:flutter/material.dart';
import 'package:route5972/main_game_page.dart';
import 'package:route5972/main_menu/main_menu_page.dart';
import 'package:route5972/ui/not_found_page.dart';

class AppRouter {
  static const String home = '/';
  static const String cityMap = '/cityMap';


  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const MainMenuPage());
      case cityMap:
        return MaterialPageRoute(builder: (_) => const MainGamePage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
