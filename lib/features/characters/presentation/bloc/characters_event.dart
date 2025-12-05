part of 'characters_bloc.dart';

abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object?> get props => [];
}

class CharactersFetched extends CharactersEvent {
  final bool refresh;

  const CharactersFetched({this.refresh = false});

  @override
  List<Object?> get props => [refresh];
}
