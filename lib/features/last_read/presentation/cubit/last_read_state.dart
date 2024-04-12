part of 'last_read_cubit.dart';

abstract class LastReadState extends Equatable {
  const LastReadState({this.surah, this.startVerse = 0, this.endVerse = 0});

  final Surah? surah;
  final int startVerse;
  final int endVerse;

  @override
  List<Object?> get props => [surah, startVerse];
}

class LastReadInitial extends LastReadState {
  const LastReadInitial({super.surah, super.startVerse = 0, super.endVerse = 0});

  @override
  List<Object?> get props => [surah, startVerse, endVerse];
}

class LastReadLoaded extends LastReadState {
  const LastReadLoaded({required super.surah, required super.startVerse, required super.endVerse});

  @override
  List<Object?> get props => [surah, startVerse, endVerse];
}

class LastReadUpdated extends LastReadState {
  const LastReadUpdated({required super.surah, required super.startVerse, required super.endVerse});

  @override
  List<Object?> get props => [surah, startVerse, endVerse];
}
