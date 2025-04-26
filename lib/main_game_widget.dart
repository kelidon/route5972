import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:route5972/common/widget/dialog_overlay_widget.dart';
import 'package:route5972/main_game.dart';
import 'package:route5972/plot/view_model/dialog_option_view_model.dart';
import 'package:route5972/plot/view_model/dialog_view_model.dart';

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
          return DialogOverlayWidget(
            model: DialogViewModel(
              text: data.text,
              options:
                  data.options
                      .map(
                        (e) => DialogOptionViewModel(
                          text: e.text,
                          onSelected: () {
                            game.hideDialog();
                            //todo find next node and show
                          },
                        ),
                      )
                      .toList(),
              backgroundImage: data.items.isNotEmpty ? data.items[0] : null,
              leftImage: data.npc,
              rightImage: null,
            ),
          );
        },
      },
    );
  }
}
