import 'dart:io';

import 'package:flutter_pokemon_clean_architecture/core/errors/exceptions.dart';
import 'package:flutter_pokemon_clean_architecture/data/data_sources/local_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/data/data_sources/remote_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_clean_architecture/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemonList() async {
    try {
      final localPokemonList = await localDataSource.getPokemonList();

      if (localPokemonList.isEmpty) {
        final remotePokemonList = await remoteDataSource.getPokemonList();
        // save pokemon list to local data source
        localDataSource.savePokemonList(remotePokemonList);
        return Right(remotePokemonList);
      } else {
        return Right(localPokemonList);
      }
    } on CacheException {
      return const Left(
        DatabaseFailure('Failed to get pokemon list from cache'),
      );
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemon(String name) async {
    try {
      final localPokemon = await localDataSource.getPokemon(name);

      if (localPokemon.isEmpty) {
        try {
          final remotePokemon = await remoteDataSource.getPokemon(name);
          localDataSource.savePokemonList(remotePokemon);
          return Right(remotePokemon);
        } on ServerException {
          return const Left(ServerFailure('No data found'));
        } on SocketException {
          return const Left(
              ConnectionFailure('Failed to connect to the network'));
        }
      } else {
        return Right(localPokemon);
      }
    } on CacheException {
      return const Left(
        DatabaseFailure('Failed to get pokemon from cache'),
      );
    }
  }
}
