part of 'characters_bloc.dart';

enum CharactersStatus { initial, loading, success, loadingMore, failure }

class CharactersState extends Equatable {
  final CharactersStatus status;
  final List<Character> characters;
  final int currentPage;
  final bool hasReachedEnd;
  final String? errorMessage;

  const CharactersState({
    this.status = CharactersStatus.initial,
    this.characters = const [],
    this.currentPage = 1,
    this.hasReachedEnd = false,
    this.errorMessage,
  });

  CharactersState copyWith({
    CharactersStatus? status,
    List<Character>? characters,
    int? currentPage,
    bool? hasReachedEnd,
    String? errorMessage,
  }) {
    return CharactersState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      currentPage: currentPage ?? this.currentPage,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, characters, currentPage, hasReachedEnd, errorMessage];
}
