import 'dart:async';
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
  intro0('intro0'),
  intro1('intro1'),
  bar('bar', variations: 3);

  final int? variations;
  final String name;
  const Music(this.name, {this.variations});

  String get path {
    final v = variations != null ? Random().nextInt(variations!) : null;
    return 'music/$name${v ?? ''}.ogg';
  }

  List<String> get variationsList {
    if (variations == null) return [];
    return List.generate(variations!, (i) => 'music/$name$i.ogg');
  }
}

class AudioService {
  bool enabled = false;
  double _currentVolume = 1;
  bool cutMusic = false;
  final bgsm = FlameAudio.bgm;
  AudioPlayer get audioPlayer => bgsm.audioPlayer;

  Future<void> load() async {
    enabled = true;
    final music = [];
    for (final m in Music.values) {
      if (m.variations != null) {
        music.addAll(m.variationsList);
      } else {
        music.add(m.path);
      }
    }
    await FlameAudio.audioCache.loadAll([
      ...Sfxs.values.map((e) => e.path),
      ...music,
    ]);
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
    if (cutMusic) return;
    await bgsm.audioPlayer.setSourceAsset(m.path);
    await bgsm.audioPlayer.setReleaseMode(ReleaseMode.release);
    bgsm.isPlaying = true;
    await audioPlayer.resume();
    await audioPlayer.onPlayerComplete.first;
    return music(m);
  }

  Future<void> substituteAudio(Music m) async {
    cutMusic = true;
    await audioPlayer.onPlayerComplete.first;
    cutMusic = false;
    return music(m);
  }
}

final AudioService audio = AudioService();
