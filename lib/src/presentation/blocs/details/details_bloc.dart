import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/use_cases/get_pokemon.dart';
import 'package:rxdart/rxdart.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(this.getPokemon) : super(DetailsEmpty()) {
    on<OnGetDetails>(
      (event, emit) async {
        final id = event.id;

        emit(DetailsLoading());

        final result = await getPokemon.call(id);

        result.fold(
          (failure) {
            emit(DetailsError(failure.message));
          },
          (data) {
            emit(DetailsHasData(data[0]));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }

  final GetPokemon getPokemon;

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
