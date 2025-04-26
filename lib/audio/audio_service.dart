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

enum Musics {
  mainMenu(3);

  final int? variations;
  const Musics(this.variations);
}

class AudioService {
  bool enabled = false;

  Future<void> load() async {
    enabled = true;
    await FlameAudio.audioCache.loadAll([
      ...Sfxs.values.map((e) => 'sfx/$e.mp3'),
      ...Musics.values.map((e) => 'sfx/$e.mp3'),
    ]);
  }

  void sfx(Sfxs sfx) {
    if (!enabled) return;
    FlameAudio.play(sfx.path);
  }
}

final AudioService audio = AudioService();
