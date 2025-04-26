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
  mainMenu('main_menu');

  final String name;
  const Musics(this.name);

  String get path => 'music/$name.mp3';
}

class AudioManager {
  static Future<void> load() async {
    await FlameAudio.audioCache.loadAll([
      ...Sfxs.values.map((e) => 'sfx/$e.mp3'),
      ...Musics.values.map((e) => 'sfx/$e.mp3'),
    ]);
  }
}
