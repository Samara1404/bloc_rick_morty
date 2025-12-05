import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/character.dart';
import '../../domain/repositories/character_repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharacterRepository repository;

  CharactersBloc(this.repository) : super(const CharactersState()) {
    on<CharactersFetched>(_onCharactersFetched);
  }

  Future<void> _onCharactersFetched(
    CharactersFetched event,
    Emitter<CharactersState> emit,
  ) async {

    if (state.hasReachedEnd && !event.refresh) return;

    try {
      if (event.refresh) {
        
        emit(state.copyWith(
          status: CharactersStatus.loading,
          characters: [],
          currentPage: 1,
          hasReachedEnd: false,
        ));
      } else if (state.status == CharactersStatus.initial) {
        
        emit(state.copyWith(status: CharactersStatus.loading));
      } else {
        
        emit(state.copyWith(status: CharactersStatus.loadingMore));
      }

      final nextPage = event.refresh ? 1 : state.currentPage;
      final newCharacters = await repository.getCharactersPage(nextPage);

      final allCharacters = event.refresh
          ? newCharacters
          : [...state.characters, ...newCharacters];

      emit(state.copyWith(
        status: CharactersStatus.success,
        characters: allCharacters,
        currentPage: nextPage + 1,
        hasReachedEnd: newCharacters.isEmpty,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: CharactersStatus.failure,
        errorMessage: 'Маалыматты алуу мүмкүн болгон жок',
      ));
    }
  }
}
