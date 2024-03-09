import '../../domain/entities/verse.dart';

class VerseModel extends Verse {
  const VerseModel({
    required super.verseKey,
    required super.content,
  });

  factory VerseModel.fromEntry(MapEntry<String, String> entry) {
    return VerseModel(
      verseKey: entry.key,
      content: entry.value,
    );
  }
}
