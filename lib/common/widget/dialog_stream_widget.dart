import 'package:flutter/material.dart';
import 'package:route5972/common/widget/dialog_overlay_widget.dart';
import 'package:route5972/main_game.dart';
import 'package:route5972/plot/model/dialog_data.dart';
import 'package:route5972/plot/view_model/dialog_option_view_model.dart';
import 'package:route5972/plot/view_model/dialog_view_model.dart';

class DialogStreamWidget extends StatelessWidget {
  final MainGame game;

  const DialogStreamWidget({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DialogData>(
      stream: game.plotService.currentDialogStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DialogOverlayWidget(
            model: DialogViewModel(
              text: snapshot.data!.text,
              options:
                  snapshot.data!.options
                      .map(
                        (e) => DialogOptionViewModel(
                          text: e.text,
                          onSelected: () {
                            //todo find next node and show
                            game.hideDialog();
                          },
                        ),
                      )
                      .toList(),
              backgroundImage: snapshot.data!.items.isNotEmpty ? snapshot.data!.items[0] : null,
              leftImage: snapshot.data!.npc,
              rightImage: null,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
