

import 'package:bloc_rick_morty/features/characters/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharactersPage(int page);
}
