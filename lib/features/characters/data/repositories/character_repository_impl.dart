import 'package:bloc_rick_morty/features/characters/data/datasources/characters_remote_datasource.dart';
import 'package:bloc_rick_morty/features/characters/data/datasources/characters_local_datasource.dart';
import 'package:bloc_rick_morty/features/characters/domain/entities/character.dart';
import 'package:bloc_rick_morty/features/characters/domain/repositories/character_repository.dart';
import 'package:bloc_rick_morty/core/network/network_info.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharactersRemoteDataSource remoteDataSource;
  final CharactersLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Character>> fetchCharacters() async {
    if (await networkInfo.hasInternetConnection()) {
      
      final apiData = await remoteDataSource.getCharacters();
      await localDataSource.cacheCharacters(apiData); 
      return apiData;
    } else {
      
      return await localDataSource.getCachedCharacters();
    }
  }

  @override
  Future<List<Character>> getCharactersPage(int page) async {
    
    final apiData = await remoteDataSource.getCharactersPage(page);
    await localDataSource.cacheCharacters(apiData); 
    return apiData;
  }
}
