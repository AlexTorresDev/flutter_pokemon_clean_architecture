import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_pokemon_clean_architecture/domain/use_cases/get_pokemon.dart';
import 'pokemon_event.dart';
import 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetPokemon getPokemon;

  PokemonBloc(this.getPokemon) : super(PokemonEmpty()) {
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
            emit(PokemonHasData(data));
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
