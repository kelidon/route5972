import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/layout.dart';
import 'package:route5972/common/components/c_text_component.dart';
import 'package:route5972/common/mixin/scene_animation_mixin.dart';
import 'package:route5972/common/constant/strings.dart';
import 'package:route5972/main_game.dart';

class IntroScene extends RectangleComponent
    with HasGameReference<MainGame>, SceneTransitionMixin {
      
  @override
  FutureOr<void> onLoad() {
    add(
      RectangleComponent(
        size: game.size,
        paint: Paint()..color = Color(0xFF000000),
        children: [
          AlignComponent(
            child: CTextComponent(Strings.audioNote),
            alignment: Anchor.center,
          ),
        ],
      ),
    );
    return super.onLoad();
  }
}
