import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:route5972/city_map/city_map_game.dart';
import 'package:route5972/ui/dialog_overlay_widget.dart';

class CityMapGameWidget extends StatelessWidget {
  const CityMapGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget<CityMapGame>(
      game: CityMapGame(),
      loadingBuilder: (context) => Center(child: Text('Loading...')),
      overlayBuilderMap: {
        CityMapGame.dialogOverlayIdentifier: (BuildContext context, CityMapGame game) {
          return DialogOverlayWidget(game: game);
        },
      },
    );
  }
}
