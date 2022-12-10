import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/errors/exceptions.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/params/pokemon_param.dart';
import 'package:flutter_pokemon_clean_architecture/src/data/data_sources/local_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/src/data/data_sources/remote_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/errors/failure.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemonList(
      PokemonParam params) async {
    try {
      /*final localPokemonList =
          await localDataSource.getPokemonList(limit, offset);

      if (localPokemonList.isEmpty) {*/
      final remotePokemonList =
          await remoteDataSource.getPokemonList(params.limit, params.offset);
      // save pokemon list to local data source
      //localDataSource.savePokemonList(remotePokemonList);
      return Right(remotePokemonList);
      /*} else {
        return Right(localPokemonList);
      }
    } on CacheException {
      return const Left(
        DatabaseFailure('Failed to get pokemon list from cache'),
      );*/
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemon(String name) async {
    /*try {
      final localPokemon = await localDataSource.getPokemon(name);

      if (localPokemon.isEmpty) {*/
    try {
      final remotePokemon = await remoteDataSource.getPokemon(name);
      //localDataSource.savePokemonList(remotePokemon);
      return Right(remotePokemon);
    } on ServerException {
      return const Left(ServerFailure('No data found'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
    /*} else {
        return Right(localPokemon);
      }
    } on CacheException {
      return const Left(
        DatabaseFailure('Failed to get pokemon from cache'),
      );
    }*/
  }
}
