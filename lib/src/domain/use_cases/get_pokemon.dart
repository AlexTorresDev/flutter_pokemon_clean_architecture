import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/errors/failure.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/repositories/pokemon_repository.dart';

class GetPokemon {
  const GetPokemon(this.repository);

  final PokemonRepository repository;

  Future<Either<Failure, List<Pokemon>>> call(String name) =>
      repository.getPokemon(name);
}
