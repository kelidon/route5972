import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class BarWorld extends World {

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load('player.png');
    await add(
      SpriteComponent.fromImage(background),
    );
    return super.onLoad();
  }
}
