import 'package:hive/hive.dart';
import '../../domain/entities/character.dart';
import '../models/character_model.dart';

class CharactersLocalDataSource {
  final Box box;

  CharactersLocalDataSource(this.box);

  
  Future<void> cacheCharacters(List<Character> characters) async {
   
    final list = characters
        .map((c) => (c as CharacterModel).toJson())
        .toList();

    await box.put('characters', list);
  }

  
  Future<List<Character>> getCachedCharacters() async {
    final data = box.get('characters', defaultValue: []);

    
    return (data as List)
        .map((e) => CharacterModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
