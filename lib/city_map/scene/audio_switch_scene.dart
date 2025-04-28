import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/layout.dart';
import 'package:route5972/audio/audio_service.dart';
import 'package:route5972/common/components/c_button_comp.dart';
import 'package:route5972/common/components/c_text_comp.dart';
import 'package:route5972/common/mixin/scene_transition_mixin.dart';
import 'package:route5972/common/constant/strings.dart';
import 'package:route5972/main_game.dart';

class AudioSwitchScene extends RectangleComponent
    with HasGameReference<MainGame>, SceneTransitionMixin {
  late RectangleComponent parentRect;
  late CButtonComp cancelComp;
  late CButtonComp confirmComp;

  Future<void> nextPage() async {
    await fadeOut(() {
      game.router.pushReplacementNamed(MainGame.map);
    });
  }

  @override
  Future<void> onLoad() async {
    size = game.size;
    paint = Paint()..color = Color(0xFF000000);

    parentRect = RectangleComponent(
      size: game.size,
      paint: Paint()..color = Color(0xFF000000),
    );

    cancelComp = _createButton(
      content: Strings.no,
      onPressed: () async {
        await nextPage();
      },
    );

    confirmComp = _createButton(
      content: Strings.yes,
      onPressed: () async {
        await audio.load();
        audio.sfx(Sfxs.startGame);
        await nextPage();
      },
    );

    parentRect.add(
      AlignComponent(
        child: CTextComp(Strings.audioNote, onEnd: () {}),
        alignment: Anchor.center,
      ),
    );

    addAll([parentRect, cancelComp, confirmComp]);

    _updateLayout();

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    size = size;
    parentRect.size = size;
    _updateLayout();
  }

  void _updateLayout() {
    cancelComp.position = parentRect.center.translated(100, 60);
    confirmComp.position = parentRect.center.translated(-100, 60);
  }

  CButtonComp _createButton({
    required String content,
    required Future<void> Function() onPressed,
  }) {
    return CButtonComp(
      content: content,
      anchor: Anchor.center,
      onPressed: onPressed,
    );
  }
}
