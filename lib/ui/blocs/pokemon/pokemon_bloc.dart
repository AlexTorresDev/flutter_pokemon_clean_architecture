import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_clean_architecture/domain/use_cases/get_pokemon_list.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_pokemon_clean_architecture/domain/use_cases/get_pokemon.dart';
import 'pokemon_event.dart';
import 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemonList getPokemonList;
  final GetPokemon getPokemon;

  PokemonBloc(this.getPokemonList, this.getPokemon) : super(PokemonEmpty()) {
    on<OnGetAll>(
      (event, emit) async {
        final limit = event.limit;
        final offset = event.offset;

        emit(PokemonLoading());

        final result = await getPokemonList.call(limit, offset);

        result.fold(
          (failure) {
            emit(PokemonError(failure.message));
          },
          (data) {
            emit(PokemonHasList(data, offset));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );

    on<OnNameChanged>(
      (event, emit) async {
        final name = event.name;

        emit(PokemonLoading());

        final result = await getPokemon.call(name);

        result.fold(
          (failure) {
            emit(PokemonError(failure.message));
          },
          (data) {
            emit(PokemonHasList(data, 0));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
