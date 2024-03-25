import 'package:just_audio/just_audio.dart';

class AudioPlayerHelper {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<Duration?> setSource(String url) async {
    return await _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(url)));
  }

  Future<void> play() async {
    return await _audioPlayer.play();
  }

  Future<void> pause() async {
    return await _audioPlayer.pause();
  }

  Future<void> stop() async {
    return await _audioPlayer.stop();
  }

  Future<void> seek(Duration position) async {
    return await _audioPlayer.seek(position);
  }

  Stream<Duration> get positionStream => _audioPlayer.positionStream;
  Stream<Duration?> get durationStream => _audioPlayer.durationStream;
  Stream<bool> get stateStream => _audioPlayer.playingStream;

  Future<void> dispose() async {
    return await _audioPlayer.dispose();
  }
}
