import 'package:bloc_rick_morty/features/characters/data/datasources/characters_remote_datasource.dart';
import 'package:bloc_rick_morty/features/characters/data/datasources/characters_local_datasource.dart';
import 'package:bloc_rick_morty/features/characters/data/repositories/character_repository_impl.dart';
import 'package:bloc_rick_morty/features/characters/presentation/bloc/characters_bloc.dart';
import 'package:bloc_rick_morty/features/characters/presentation/pages/characters_page.dart';

import 'package:bloc_rick_morty/core/network/network_info.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  final box = await Hive.openBox('charactersBox');

  final dio = Dio();
  final remote = CharactersRemoteDataSource(dio);
  final local = CharactersLocalDataSource(box);
  final network = NetworkInfoImpl();



  final repo = CharacterRepositoryImpl(
    remoteDataSource: remote,
    localDataSource: local,
    networkInfo: network,
  );

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
        child: const CharactersPage(),
      ),
    );
  }
}
