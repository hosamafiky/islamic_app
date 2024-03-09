// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Verse extends Equatable {
  final String verseKey;
  final String content;

  const Verse({required this.verseKey, required this.content});

  @override
  List<Object> get props => [verseKey, content];
}
