import 'package:flutter_pokemon_clean_architecture/ui/bloc/pokemon_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_pokemon_clean_architecture/data/data_sources/remote_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_pokemon_clean_architecture/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon_clean_architecture/domain/use_cases/get_pokemon.dart';

final sl = GetIt.instance;

void init() {
  // BLoC
  sl.registerFactory(() => PokemonBloc(sl()));

  // Use case
  sl.registerLazySingleton(() => GetPokemon(sl()));

  // Repository
  sl.registerLazySingleton<PokemonRepository>(() => PokemonRepositoryImpl(
        remoteDataSource: sl(),
        //localDataSource: sl(),
      ));

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));

  // Core
  sl.registerLazySingleton(() => http.Client());
}
