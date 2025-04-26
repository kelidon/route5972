import 'package:flutter/material.dart';
import 'package:route5972/main_game_widget.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map.fromIterable(
            TargetPlatform.values,
            value: (final _) => const FadeUpwardsPageTransitionsBuilder(),
          ),
        ),
      ),
      home: MainGameWidget(),
    );
  }
}
