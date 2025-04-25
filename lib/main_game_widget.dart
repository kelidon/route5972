import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:route5972/dialog/dialog_overlay_widget.dart';
import 'package:route5972/main_game.dart';

class MainGameWidget extends StatelessWidget {
  const MainGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget<MainGame>(
      game: MainGame(),
      loadingBuilder: (context) => Center(child: Text('Loading...')),
      overlayBuilderMap: {
        MainGame.dialogOverlayIdentifier: (context, game) {
          final data = game.currentDialog!;
          return DialogOverlayWidget(data: data);
        },
      },
    );
  }
}
