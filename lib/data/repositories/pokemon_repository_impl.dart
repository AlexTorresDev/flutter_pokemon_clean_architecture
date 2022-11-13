import 'dart:io';

import 'package:flutter_pokemon_clean_architecture/core/errors/exceptions.dart';
import 'package:flutter_pokemon_clean_architecture/data/data_sources/remote_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_clean_architecture/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final RemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Pokemon>> getPokemon(String name) async {
    try {
      final result = await remoteDataSource.getPokemon(name);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
