import 'package:bloc_rick_morty/features/characters/data/datasources/character_remote_datasource.dart';
import 'package:bloc_rick_morty/features/characters/data/repositories/character_repository_impl.dart';
import 'package:bloc_rick_morty/features/characters/presentation/bloc/characters_bloc.dart';
import 'package:bloc_rick_morty/features/characters/presentation/pages/characters_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';



void main() {
  final dio = Dio();
  final remote = CharacterRemoteDataSource(dio);
  final repo = CharacterRepositoryImpl(remote);
  
  runApp(MyApp(repository: repo));
}

class MyApp extends StatelessWidget {
  final CharacterRepositoryImpl repository;
  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CharactersBloc(repository),
        child: CharactersPage(),
      ),
    );
  }
}
