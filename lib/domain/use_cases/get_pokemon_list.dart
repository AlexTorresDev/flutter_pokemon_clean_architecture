import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon_clean_architecture/core/errors/failure.dart';
import 'package:flutter_pokemon_clean_architecture/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/domain/repositories/pokemon_repository.dart';

class GetPokemonList {
  final PokemonRepository repository;

  GetPokemonList(this.repository);

  Future<Either<Failure, List<Pokemon>>> call() => repository.getPokemonList();
}
