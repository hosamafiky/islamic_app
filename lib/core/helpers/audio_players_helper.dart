import 'package:audioplayers/audioplayers.dart';

class AudioPlayerHelper {
  final AudioPlayer _audioPlayer = AudioPlayer();

  late String url;

  Future<void> setSource(String url) async {
    this.url = url;
    return await _audioPlayer.setSource(UrlSource(url));
  }

  Future<void> play() async {
    return await _audioPlayer.play(_audioPlayer.source ?? UrlSource(url));
  }

  Future<void> pause() async {
    return await _audioPlayer.pause();
  }

  Future<void> stop() async {
    return await _audioPlayer.stop();
  }

  Future<void> release() async {
    return await _audioPlayer.release();
  }

  Future<void> resume() async {
    return await _audioPlayer.resume();
  }

  Future<void> seek(Duration position) async {
    return await _audioPlayer.seek(position);
  }

  Stream<Duration> get positionStream => _audioPlayer.onPositionChanged;
  Stream<Duration> get durationStream => _audioPlayer.onDurationChanged;
  Stream<PlayerState> get stateStream => _audioPlayer.onPlayerStateChanged;
  PlayerState get state => _audioPlayer.state;
  Future<Duration?> get duration => _audioPlayer.getDuration();

  Future<void> dispose() async {
    return await _audioPlayer.release();
  }
}
