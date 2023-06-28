import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/entities/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/blocs/blocs.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/widgets/widgets.dart';
import 'widgets/pokemon_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _limit = 20;

  final PagingController<int, Pokemon> _pagingController =
      PagingController(firstPageKey: 0);

  late PokemonCubit _pokemonCubit;

  @override
  void initState() {
    super.initState();
    _pokemonCubit = context.read<PokemonCubit>();

    _pokemonCubit.getAll(_limit, 0);
    _pagingController.addPageRequestListener(
        (pageKey) => _pokemonCubit.getAll(_limit, pageKey));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon'),
      ),
      body: BlocListener<PokemonCubit, PokemonState>(
        listener: (context, state) {
          if (state is PokemonHasList) {
            if (state.result.length < _limit) {
              _pagingController.appendLastPage(state.result);
            } else {
              final nextPageKey = state.offset + state.result.length;
              _pagingController.appendPage(state.result, nextPageKey);
            }
          } else if (state is PokemonError) {
            _pagingController.error = state.message;
          }
        },
        child: BlocBuilder<PokemonCubit, PokemonState>(
          builder: (context, state) {
            if (state is PokemonLoading) {
              return const Loading();
            } else if (state is PokemonHasList) {
              return Column(
                children: [
                  // const ConnectionStatus(),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: _pokemonCubit.getByName,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: PagedListView<int, Pokemon>(
                      pagingController: _pagingController,
                      builderDelegate: PagedChildBuilderDelegate(
                        itemBuilder: (_, item, __) =>
                            PokemonCard(pokemon: item),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is PokemonError) {
              return Text('Error: ${state.message}');
            } else {
              return const Text('No data');
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
