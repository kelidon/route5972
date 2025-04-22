import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Image, Gradient;
import 'package:route5972/space_game.dart';

class SpaceGameWidget extends StatelessWidget {
  const SpaceGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget<SpaceGame>(
      game: SpaceGame(),
      loadingBuilder:
          (context) =>
              Center(child: Text('Loading...', style: Theme.of(context).textTheme.displayLarge)),
      overlayBuilderMap: {},
    );
  }
}
