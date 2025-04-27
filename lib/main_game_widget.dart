import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:route5972/common/style/text_paint.dart';
import 'package:route5972/common/widget/dialog_stream_widget.dart';
import 'package:route5972/main_game.dart';

class MainGameWidget extends StatelessWidget {
  const MainGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget<MainGame>(
        game: MainGame(),
        loadingBuilder: (context) => Center(
          child: Text(
            'Loading...',
            style: TextPaints.large.style,
          ),
        ),
        overlayBuilderMap: {
          dialogOverlayIdentifier: (context, game) {
            return DialogStreamWidget(game: game);
          },
        },
      ),
    );
  }
}
