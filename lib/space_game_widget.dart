import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Image, Gradient;
import 'package:route5972/space_game.dart';



class SpaceGameWidget extends StatelessWidget {
  const SpaceGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 35, color: Colors.white),
        labelLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(fontSize: 28, color: Colors.grey),
        bodyMedium: TextStyle(fontSize: 18, color: Colors.grey),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: const Size(150, 50),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hoverColor: Colors.red.shade700,
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        border: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red.shade700)),
      ),
    );

    return MaterialApp(
      title: 'PadRacing',
      home: GameWidget<SpaceGame>(
        game: SpaceGame(),
        loadingBuilder:
            (context) =>
                Center(child: Text('Loading...', style: Theme.of(context).textTheme.displayLarge)),
        overlayBuilderMap: {
          // 'menu': (_, game) => Menu(game),
          // 'game_over': (_, game) => GameOver(game),
        },
        //initialActiveOverlays: const ['menu'],
      ),
      theme: theme,
    );
  }
}
