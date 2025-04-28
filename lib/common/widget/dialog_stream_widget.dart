import 'package:flutter/material.dart';
import 'package:route5972/common/widget/dialog_overlay_widget.dart';
import 'package:route5972/main_game.dart';
import 'package:route5972/plot/model/dialog_data.dart';

class DialogStreamWidget extends StatelessWidget {
  final MainGame game;

  const DialogStreamWidget({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AbsorbPointer(absorbing: true, child: SizedBox.expand()),
        StreamBuilder<DialogData>(
          stream: game.plotService.currentDialogStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DialogOverlayWidget(
                text: snapshot.data!.text,
                options: snapshot.data!.options
                    .map(
                      (e) => (
                        text: e.text,
                        onSelect: () {
                          // todo find next node and show
                          if (e.nextNode.type == 'location') {
                            game.hideDialog();
                            game.router
                                .pushReplacementNamed(switch (e.nextNode.id) {
                              'loc1' => MainGame.bar,
                              'loc2' => MainGame.techPit,
                              'loc3' => MainGame.terminal,
                              _ => MainGame.map,
                            });
                            return;
                          }
                          if (e.nextNode.type == 'race') {
                            game.hideDialog();
                            game.router.pushReplacementNamed(MainGame.race);
                            return;
                          }
                          if (e.nextNode.type == 'dialog') {
                            final nextDialog = game.plotService.getDialog(
                              e.nextNode.id,
                            );
                            if (nextDialog == null) return;
                            game.showDialog(nextDialog);
                          }
                        },
                      ),
                    )
                    .toList(),
                leftImage: game.plotService.getNPC(snapshot.data!.npc)?.image,
                rightImage: null,
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
