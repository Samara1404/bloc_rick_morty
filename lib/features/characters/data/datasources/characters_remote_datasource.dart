import 'package:dio/dio.dart';
import '../../domain/entities/character.dart';
import '../models/character_model.dart';

class CharactersRemoteDataSource {
  final Dio dio;

  CharactersRemoteDataSource(this.dio);

  Future<List<Character>> getCharacters() async {
    final response = await dio.get('https://rickandmortyapi.com/api/character');
    final results = response.data['results'] as List;

    return results.map((e) => CharacterModel.fromJson(e)).toList();
  }

  Future<List<Character>> getCharactersPage(int page) async {
    final response =
        await dio.get('https://rickandmortyapi.com/api/character?page=$page');
    final results = response.data['results'] as List;

    return results.map((e) => CharacterModel.fromJson(e)).toList();
  }
}
