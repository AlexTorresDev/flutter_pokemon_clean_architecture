import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/errors/failure.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/params/pokemon_param.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/repositories/pokemon_repository.dart';

class PokemonUsecase {
  const PokemonUsecase(this._pokemonRepository);

  final PokemonRepository _pokemonRepository;

  Future<Either<Failure, List<Pokemon>>> getAll(int limit, int offset) async {
    return await _pokemonRepository.getPokemonList(
      PokemonParam(limit: limit, offset: offset),
    );
  }

  Future<Either<Failure, List<Pokemon>>> getById(String name) async {
    return await _pokemonRepository.getPokemon(name);
  }
}
