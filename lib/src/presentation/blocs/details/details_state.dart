import 'package:equatable/equatable.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/entities/pokemon.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object?> get props => [];
}

class DetailsEmpty extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsError extends DetailsState {
  const DetailsError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

class DetailsHasData extends DetailsState {
  const DetailsHasData(this.pokemon);

  final Pokemon pokemon;

  @override
  List<Object?> get props => [pokemon];
}
