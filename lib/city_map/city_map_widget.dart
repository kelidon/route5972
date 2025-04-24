import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:route5972/city_map/city_map_game.dart';

class CityMapGameWidget extends StatelessWidget {
  const CityMapGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget<CityMapGame>(
      game: CityMapGame(),
      loadingBuilder: (context) => Center(child: Text('Loading...')),
      overlayBuilderMap: {},
    );
  }
}
