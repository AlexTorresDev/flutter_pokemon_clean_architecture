import 'package:flutter/material.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/providers/pokemon_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/entities/pokemon.dart';
import 'widgets/pokemon_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  static const _limit = 20;

  late final _pagingController = PagingController<int, Pokemon>(
    getNextPageKey: (state) => (state.keys?.last ?? 0) + _limit,
    fetchPage: (pageKey) => ref.read(pokemonProvider),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon')),
      body: PagingListener(
        controller: _pagingController,
        builder:
            (context, state, fetchNextPage) => PagedListView<int, Pokemon>(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder:
                    (context, item, index) => PokemonCard(pokemon: item),
              ),
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
