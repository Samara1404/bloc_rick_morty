import 'package:dio/dio.dart';
import '../models/character_model.dart';

class CharacterRemoteDataSource {
  final Dio dio;

  CharacterRemoteDataSource(this.dio);

  Future<List<CharacterModel>> getCharactersPage(int page) async {
    final response = await dio.get(
      'https://rickandmortyapi.com/api/character',
      queryParameters: {'page': page},
    );

    final results = response.data['results'] as List<dynamic>;

    return results
        .map((json) => CharacterModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
