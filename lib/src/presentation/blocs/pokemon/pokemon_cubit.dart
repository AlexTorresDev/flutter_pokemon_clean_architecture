import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/params/pokemon_param.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/use_cases/get_pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/use_cases/get_pokemon_list.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/blocs/blocs.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit(this.getPokemonList, this.getPokemon) : super(PokemonLoading());

  final GetPokemonList getPokemonList;
  final GetPokemon getPokemon;

  Future<void> getAll(int limit, int offset) async {
    final result =
        await getPokemonList.call(PokemonParam(limit: limit, offset: offset));

    result.fold(
      (failure) {
        emit(PokemonError(failure.message));
      },
      (data) {
        emit(PokemonHasList(data, offset));
      },
    );
  }

  Future<void> getByName(String name) async {
    final result = await getPokemon.call(name);

    result.fold(
      (failure) {
        emit(PokemonError(failure.message));
      },
      (data) {
        emit(PokemonHasList(data, 0));
      },
    );
  }

  Future<void> getDetails(String name) async {
    final result = await getPokemon.call(name);

    result.fold(
      (failure) {
        emit(PokemonError(failure.message));
      },
      (data) {
        emit(PokemonHasDetails(data[0]));
      },
    );
  }
}
