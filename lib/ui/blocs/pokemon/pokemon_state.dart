import 'package:equatable/equatable.dart';
import 'package:flutter_pokemon_clean_architecture/domain/entities/pokemon.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object?> get props => [];
}

class PokemonEmpty extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonError extends PokemonState {
  const PokemonError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class PokemonHasList extends PokemonState {
  const PokemonHasList(this.result);

  final List<Pokemon> result;

  @override
  List<Object?> get props => [result];
}

class PokemonHasData extends PokemonState {
  const PokemonHasData(this.result);

  final Pokemon result;

  @override
  List<Object?> get props => [result];
}

class PokemonHasDetails extends PokemonState {
  const PokemonHasDetails(this.result);

  final Pokemon result;

  @override
  List<Object?> get props => [result];
}
