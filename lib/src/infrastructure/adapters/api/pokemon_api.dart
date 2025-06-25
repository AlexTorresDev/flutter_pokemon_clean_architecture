import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/errors/exceptions.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/errors/failure.dart';
import 'package:flutter_pokemon_clean_architecture/src/data/datasources/local_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/src/data/datasources/remote_data_source.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/models/pokemon.dart';

class PokemonApi implements PokemonGateway {
  PokemonApi({required this.remoteDataSource, required this.localDataSource});

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<PokemonModel>>> getPokemonList(int limit, int offset) async {
    try {
      /*final localPokemonList =
          await localDataSource.getPokemonList(limit, offset);

      if (localPokemonList.isEmpty) {*/
      final remotePokemonList = await remoteDataSource.getPokemonList(
        limit,
        offset,
      );
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
      return const Left(ServerFailure('Failed to get pokemon list'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<PokemonModel>>> getPokemon(String name) async {
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
