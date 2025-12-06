import 'package:bloc_rick_morty/features/characters/domain/entities/character.dart';

class CharacterModel extends Character {
   CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.image, 
    required super.species, 
    required super.type, 
    required super.gender, 
    required super.origin, 
    required super.location, required super.episodeCount,
  });
  
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
  return CharacterModel(
    id: json['id'] as int,
    name: json['name'] as String,
    status: json['status'] as String,
    image: json['image'] as String,
    species: json['species'] as String? ?? '',
    type: json['type'] as String? ?? '',
    gender: json['gender'] as String? ?? '',
    origin: json['origin']?['name'] as String? ?? '',
    location: json['location']?['name'] as String? ?? '',
    episodeCount: (json['episode'] as List).length,
  );
}

  toJson() {}
}
