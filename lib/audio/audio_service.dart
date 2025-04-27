import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flame_audio/flame_audio.dart';

enum Sfxs {
  boostOut('boost_out'),
  boostStart('boost_start'),
  click('click'),
  startGame('start_game'),
  switchClick('switch');

  final String name;
  const Sfxs(this.name);
  String get path => 'sfx/$name.mp3';
}

enum Music {
  intro('intro', variations: 3);

  final int? variations;
  final String name;
  const Music(this.name, {this.variations});

  String get path {
    final v = variations != null ? Random().nextInt(variations!) : null;
    return 'music/$name${v ?? ''}.ogg';
  }
}

class AudioService {
  bool enabled = false;
  double _currentVolume = 1;
  StreamSubscription? onTrackComplete;

  Future<void> load() async {
    enabled = true;
    FlameAudio.bgm.initialize();
  }

  void sfx(Sfxs sfx) {
    if (!enabled) return;
    FlameAudio.play(sfx.path);
  }

  Future<void> fadeOutCurrent() async {
    if (!enabled) return;
    final completer = Completer<void>();
    Timer.periodic(Duration(milliseconds: 10), (me) async {
      if (_currentVolume <= 0) {
        _currentVolume = 0;
        me.cancel();
        await FlameAudio.bgm.audioPlayer.stop();
        FlameAudio.bgm.isPlaying = false;
        completer.complete();
      } else {
        _currentVolume = max(0, _currentVolume - 0.01);
        await FlameAudio.bgm.audioPlayer.setVolume(_currentVolume);
      }
    });
    return completer.future;
  }

  Future<void> music(Music m) async {
    if (!enabled) return;
    await FlameAudio.bgm.audioPlayer.setSourceAsset(m.path);
    await FlameAudio.bgm.audioPlayer.setReleaseMode(ReleaseMode.release);
    FlameAudio.bgm.isPlaying = true;
    await FlameAudio.bgm.audioPlayer.resume();
    await FlameAudio.bgm.audioPlayer.onPlayerComplete.first;
    return music(m);
  }
}

final AudioService audio = AudioService();
