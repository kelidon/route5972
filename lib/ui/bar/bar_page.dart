import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:route5972/ui/bar/bar_game.dart';
import 'package:route5972/ui/bar/bar_world.dart';

class BarPage extends StatelessWidget {
  const BarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: BarGame(
        world: BarWorld(),
      ),
    );
  }
}
